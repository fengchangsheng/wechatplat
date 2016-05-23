package com.fcs.platform.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import static javafx.scene.input.KeyCode.Y;

/**
 * Created by Lucare.Feng on 2016/5/23.
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface Operate {

    String name();
}
