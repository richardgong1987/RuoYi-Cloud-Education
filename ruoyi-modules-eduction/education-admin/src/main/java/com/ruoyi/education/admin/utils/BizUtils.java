package com.ruoyi.education.admin.utils;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import com.ruoyi.system.api.domain.SysDictData;

public class BizUtils {
    public static List<SysDictData> toSysDictData(List results) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        var ret = new ArrayList<SysDictData>();
        for (Object item : results) {
            SysDictData sysDictData = new SysDictData();
            String name = item.getClass().getMethod("getName", null).invoke(item,null)+"";
            String id = item.getClass().getMethod("getId", null).invoke(item,null)+"";
            sysDictData.setDictLabel(name);
            sysDictData.setDictValue(id);
            ret.add(sysDictData);
        }
        return ret;
    }
}
