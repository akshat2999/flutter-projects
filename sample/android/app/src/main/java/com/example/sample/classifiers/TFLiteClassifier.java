package com.example.sample.classifiers;

import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;

import com.example.sample.classifiers.behaviors.ClassifyBehavior;

import org.tensorflow.lite.Interpreter;
import org.tensorflow.lite.gpu.GpuDelegate;

import java.io.FileInputStream;
import java.io.IOException;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

// Abstract classifier using tflite format
public abstract class TFLiteClassifier {
    protected AssetManager mAssetManager;

    protected Interpreter mInterpreter;

    protected Interpreter.Options mTFLiteInterpreterOptions;

    protected List<String> mLabels;

    protected ClassifyBehavior classifyBehavior;

    public TFLiteClassifier(AssetManager assetManager, String modelFileName, String[] labels) {
        mAssetManager = assetManager;

        GpuDelegate.Options options = new GpuDelegate.Options()
                       .setPrecisionLossAllowed(true)
                       .setInferencePreference(GpuDelegate.Options.INFERENCE_PREFERENCE_FAST_SINGLE_ANSWER);
               GpuDelegate delegate = new GpuDelegate(options);
        mTFLiteInterpreterOptions = new Interpreter.Options().addDelegate(delegate);

        try {
            mInterpreter = new Interpreter(loadModel(modelFileName), mTFLiteInterpreterOptions);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        mLabels = new ArrayList<>(Arrays.asList(labels));
    }
    

    public MappedByteBuffer loadModel(String modelFileName) throws IOException {
        AssetFileDescriptor fileDescriptor = mAssetManager.openFd(modelFileName);
        FileInputStream inputStream = new FileInputStream(fileDescriptor.getFileDescriptor());

        FileChannel fileChannel = inputStream.getChannel();

        long startOffset = fileDescriptor.getStartOffset();
        long declaredLength = fileDescriptor.getDeclaredLength();

        return fileChannel.map(FileChannel.MapMode.READ_ONLY, startOffset, declaredLength);
    }

    // Close the interpreter to avoid memory leaks
    public void close() {
        mInterpreter.close();
    }

    public Interpreter getInterpreter() {
        return mInterpreter;
    }

    public List<String> getLabels() {
        return mLabels;
    }

    public void setLabels(List<String> labels) {
        mLabels = labels;
    }
}
