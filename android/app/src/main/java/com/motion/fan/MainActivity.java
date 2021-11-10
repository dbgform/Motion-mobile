package com.motion.fan;

import io.flutter.embedding.android.FlutterActivity;

import io.flutter.embedding.android.FlutterActivity;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

import android.os.Bundle;
import android.os.SystemClock;
import android.serialport.SerialPort;
import android.util.Log;


import com.licheedev.hwutils.ByteUtil;
import com.licheedev.myutils.LogPlus;
import io.reactivex.Observable;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

public class MainActivity extends FlutterActivity {
   // private static final String CHANNEL = "samples.flutter.dev/serial";
    private EventChannel channel;
    //DownloadManager manager;
    public static final String TAG = "eventchannelsample";
    public static final String STREAM = "com.example.jflutter_bike/stream";
    private Disposable timerSubscription;
    public String HEX;
    public SerialPort serialPort;
    public SerialReadThread mReadThread;
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        new EventChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), STREAM).setStreamHandler(
                new EventChannel.StreamHandler() {
                    @Override
                    public void onListen(Object args, EventChannel.EventSink events) {

                        try {
                            serialPort = new SerialPort(new File("/dev/ttyS3"), 9600);
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                        mReadThread = new SerialReadThread(serialPort.getInputStream());
                        mReadThread.start();

                        OutputStream mOutputStream = serialPort.getOutputStream();
                        Log.w(TAG, "adding listener");
                        timerSubscription = Observable
                                .interval(0, 1, TimeUnit.SECONDS)
                                .observeOn(AndroidSchedulers.mainThread())
                                .subscribe(
                                        (Long timer) -> {
                                            Log.w(TAG, "emitting timer event " + HEX);
                                            events.success(HEX);
                                        },
                                        (Throwable error) -> {
                                            Log.e(TAG, "error in emitting timer", error);
                                            events.error("STREAM", "Error in processing observable", error.getMessage());
                                        },
                                        () -> Log.w(TAG, "closing the timer observable")
                                );
                    }
                    @Override
                    public void onCancel(Object args) {
                        Log.w(TAG, "cancelling listener");
                        //timerSubscription.dispose();
                       // mReadThread.close();
                       // serialPort.tryClose();
                        mReadThread.close();
                        serialPort.close();
                        serialPort = null;
                        HEX = null;
                        //


                       // mReadThread.onCancel()
                    }
                }
        );
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
      //  setContentView(R.layout.activity_main);
       // GeneratedPluginRegistrant.registerWith(this);
    //    manager = (DownloadManager) getSystemService(Context.DOWNLOAD_SERVICE);
    //    Uri uri = Uri.parse("https://file.io/sJFF03CHTeBx");
    //    DownloadManager.Request request = new DownloadManager.Request(uri);
    //    request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE);
    //    long reference = manager.enqueue(request);

       //Log.w(TAG, "PATH IS " + Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS); )
    }

    private Map<Object, Runnable> listeners = new HashMap<>();




    


    private class SerialReadThread extends Thread {

        private static final String TAG = "SerialReadThread";

        private BufferedInputStream mInputStream;

        public SerialReadThread(InputStream is) {
            mInputStream = new BufferedInputStream(is);
        }

        @Override
        public void run() {
            byte[] received = new byte[1024];
            int size;

            LogPlus.e("开始读线程");

            while (true) {

                if (Thread.currentThread().isInterrupted()) {
                    break;
                }
                try {

                    int available = mInputStream.available();

                    if (available > 0) {
                        size = mInputStream.read(received);
                        if (size > 0) {
                            onDataReceive(received, size);
                        }
                    } else {
                        // 暂停一点时间，免得一直循环造成CPU占用率过高
                        SystemClock.sleep(1);
                    }
                } catch (IOException e) {
                    LogPlus.e("读取数据失败", e);
                }
                //Thread.yield();
            }

            LogPlus.e("结束读进程");
        }

        /**
         * 处理获取到的数据
         *dsdsds
         * @param received
         * @param size
         */
        private void onDataReceive(byte[] received, int size) {
            // TODO: 2018/3/22 解决粘包、分包等
            String hexStr = ByteUtil.bytes2HexStr(received, 0, size);
            //Log.i("Message", "MSG: " + "" + hexStr);
            HEX = hexStr;
            //LogManager.instance().post(new RecvMessage(hexStr));
            // String cadence = hexStr.substring(hexStr.length() - 2);
            // String cadence2 = hexStr.substring(28,30);
            // int temp1 = Integer.parseInt(cadence2, 16 );
            // String velocity;
            // int count = 0;
            // for (int i=30; i > 0; i = i - 2) {
            //     count = count + 1;
            //     velocity = hexStr.substring(i, i - 2);
            //     int temp = Integer.parseInt(velocity);
            //     Log.i("Message", count + "" + temp);
            //     // Log.i("Message", "MSG: " + "" + temp1);
            // }
        }

        /**
         * 停止读线程
         */
        public void close() {

            try {
                mInputStream.close();
            } catch (IOException e) {
                LogPlus.e("异常", e);
            } finally {
                super.interrupt();
            }
        }
    }
    private class RecvMessage implements IMessage {

        private String command;
        private String message;

        public RecvMessage(String command) {
            this.command = command;
            this.message = currentTime() + "    收到命令：" + command;
        }

        @Override
        public String getMessage() {
            return message;
        }

        @Override
        public boolean isToSend() {
            return false;
        }
    }

    private interface IMessage {
        /**
         * 消息文本
         *
         * @return
         */
        String getMessage();

        /**
         * 是否发送的消息
         *
         * @return
         */
        boolean isToSend();
    }


    public static final SimpleDateFormat DEFAULT_FORMAT =
        new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");

    public static String currentTime() {
        Date date = new Date();
        return DEFAULT_FORMAT.format(date);
    }
    // @Override
    // public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    //     super.configureFlutterEngine(flutterEngine);
    //         new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessage(), CHANNEL)
    //             .setMethodCallHandler(
    //                 (call, result) -> {

    //                 }
    //             )
    // }
}