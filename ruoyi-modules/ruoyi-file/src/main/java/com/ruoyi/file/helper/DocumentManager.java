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

package com.ruoyi.file.helper;


import java.net.InetAddress;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.primeframework.jwt.Signer;
import org.primeframework.jwt.domain.JWT;
import org.primeframework.jwt.hmac.HMACSigner;

public class DocumentManager {


    public static List<String> GetEditedExts() {
        String exts = ConfigManager.GetProperty("files.docservice.edited-docs");
        return Arrays.asList(exts.split("\\|"));
    }


    public static String CurUserHostAddress(String userAddress) {
        if (userAddress == null) {
            try {
                userAddress = InetAddress.getLocalHost().getHostAddress();
            } catch (Exception ex) {
                userAddress = "";
            }
        }

        return userAddress.replaceAll("[^0-9a-zA-Z.=]", "_");
    }


    public static String CreateToken(Map<String, Object> payloadClaims) {
        try {
            Signer signer = HMACSigner.newSHA256Signer(GetTokenSecret());
            JWT jwt = new JWT();
            for (String key : payloadClaims.keySet()) {
                jwt.addClaim(key, payloadClaims.get(key));
            }
            return JWT.getEncoder().encode(jwt, signer);
        } catch (Exception e) {
            return "";
        }
    }

    public static Boolean TokenEnabled() {
        String secret = GetTokenSecret();
        return secret != null && !secret.isEmpty();
    }

    private static String GetTokenSecret() {
        return ConfigManager.GetProperty("files.docservice.secret");
    }
}
