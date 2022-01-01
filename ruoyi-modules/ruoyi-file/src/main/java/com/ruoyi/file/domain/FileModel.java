/**
 * (c) Copyright Ascensio System SIA 2021
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.ruoyi.file.domain;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ruoyi.file.helper.DocumentManager;
import com.ruoyi.file.helper.FileUtility;
import com.ruoyi.file.helper.ServiceConverter;
import lombok.Data;

@Data
public class FileModel {
    public String type = "desktop";
    public String mode = "edit";
    public String documentType;
    public Document document;
    public EditorConfig editorConfig;
    public String token;

    public FileModel(String fileName, String fileUrl, String fileModifyTime, String uid, String uname, String mode) {
        if (fileName == null) fileName = "";
        fileName = fileName.trim();

        documentType = FileUtility.GetFileType(fileName).toString().toLowerCase();

        document = new Document();
        document.title = fileName;
        document.url = fileUrl;
//        document.urlUser = DocumentManager.GetFileUri(fileName, false);
        document.fileType = FileUtility.GetFileExtension(fileName).replace(".", "");
        document.key = ServiceConverter.GenerateRevisionId(DocumentManager.CurUserHostAddress(null) + "/" + fileName + "/" + fileModifyTime);
        document.info = new Info();
        document.info.favorite = uid != null && !uid.isEmpty() ? uid.equals("uid-2") : null;

        editorConfig = new EditorConfig(null);
//        editorConfig.callbackUrl = DocumentManager.GetCallback(fileName);
//        editorConfig.lang = null;

        if (uid != null) editorConfig.user.id = uid;
        if (uname != null) editorConfig.user.name = uid.equals("uid-0") ? null : uname;
        if (editorConfig.user.id.equals("uid-2")) editorConfig.user.group = "group-2";
        if (editorConfig.user.id.equals("uid-3")) editorConfig.user.group = "group-3";

//        editorConfig.customization.goback.url = DocumentManager.GetServerUrl(false) + "/IndexServlet";

        changeType(mode, type);
    }

    public void changeType(String _mode, String _type) {
        if (_mode != null) mode = _mode;
        if (_type != null) type = _type;

        Boolean canEdit = DocumentManager.GetEditedExts().contains(FileUtility.GetFileExtension(document.title));
        editorConfig.customization.submitForm = canEdit && (mode.equals("edit") || mode.equals("fillForms"));
        editorConfig.mode = canEdit && !mode.equals("view") ? "edit" : "view";

        document.permissions = new Permissions(mode, type, canEdit);

        if (type.equals("embedded")) InitDesktop();
    }

    public void InitDesktop() {
        editorConfig.InitDesktop(document.urlUser);
    }

    @Data
    public class Document {
        public String title;
        public String url;
        public String urlUser;
        public String fileType;
        public String key;
        public Info info;
        public Permissions permissions;
    }

    @Data
    public class Permissions {
        public Boolean comment;
        public Boolean download;
        public Boolean edit;
        public Boolean fillForms;
        public Boolean modifyFilter;
        public Boolean modifyContentControl;
        public Boolean review;
        public List<String> reviewGroups;

        public Permissions(String mode, String type, Boolean canEdit) {
            comment = !mode.equals("view") && !mode.equals("fillForms") && !mode.equals("embedded") && !mode.equals("blockcontent");
            download = true;
            edit = canEdit && (mode.equals("edit") || mode.equals("view") || mode.equals("filter") || mode.equals("blockcontent"));
            fillForms = !mode.equals("view") && !mode.equals("comment") && !mode.equals("embedded") && !mode.equals("blockcontent");
            modifyFilter = !mode.equals("filter");
            modifyContentControl = !mode.equals("blockcontent");
            review = mode.equals("edit") || mode.equals("review");
            reviewGroups = editorConfig.user.group != null ? GetReviewGroups(editorConfig.user.group) : null;
        }

        private List<String> GetReviewGroups(String group) {
            Map<String, List<String>> reviewGroups = new HashMap<>();

            reviewGroups.put("group-2", Arrays.asList("group-2", ""));
            reviewGroups.put("group-3", Arrays.asList("group-2"));

            return reviewGroups.get(group);
        }
    }

    @Data
    public class Info {
        Boolean favorite;
    }

    public class EditorConfig {
        public HashMap<String, Object> actionLink = null;
        public String mode = "edit";
        public String callbackUrl;
        public String lang = "en";
        public User user;
        public Customization customization;
        public Embedded embedded;

        public EditorConfig(String actionData) {
            if (actionData != null) {
                Gson gson = new Gson();
                actionLink = gson.fromJson(actionData, new TypeToken<HashMap<String, Object>>() {
                }.getType());
            }
            user = new User();
            customization = new Customization();
        }

        public void InitDesktop(String url) {
            embedded = new Embedded();
            embedded.saveUrl = url;
            embedded.embedUrl = url;
            embedded.shareUrl = url;
            embedded.toolbarDocked = "top";
        }

        public class User {
            public String id = "uid-1";
            public String name = "John Smith";
            public String group = null;
        }

        public class Customization {
            public Goback goback;
            public Boolean forcesave;
            public Boolean submitForm;

            public Customization() {
                forcesave = false;
                goback = new Goback();
            }

            public class Goback {
                public String url;
            }
        }

        public class Embedded {
            public String saveUrl;
            public String embedUrl;
            public String shareUrl;
            public String toolbarDocked;
        }
    }
}
