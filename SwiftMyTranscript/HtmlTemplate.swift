//
//  HtmlTemplate.swift
//  SwiftMyTranscript
//
//  Created by ChenQianPing on 16/7/20.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import Foundation

let HTML_HEARDER = "<!DOCTYPE html> \n" +
    "<html> \n" +
    "<head> \n" +
    "<title>Practical CSS3 tables with rounded corners - demo</title>\n" +
    
    "<style> \n" +
    "body { \n" +
    "width: 100%; \n" +
    "text-align:center; \n" +
    "margin: 40px auto; \n" +
    "  font-family: 'trebuchet MS', 'Lucida sans', Arial; \n" +
    " font-size: 12px; \n" +
    "color: #444; \n" +
    "} \n" +
    
    "table { \n" +
    "    *border-collapse: collapse; /* IE7 and lower */ \n" +
    "    border-spacing: 0; \n" +
    "    margin:0px auto; \n" +
    "width: 90%; \n" +
    "} \n" +
    
    ".bordered { \n" +
    "border: solid #ccc 1px; \n" +
    "    -moz-border-radius: 6px; \n" +
    "    -webkit-border-radius: 6px; \n" +
    "    border-radius: 6px; \n" +
    "    -webkit-box-shadow: 0 1px 1px #ccc; \n" +
    "    -moz-box-shadow: 0 1px 1px #ccc; \n" +
    "    box-shadow: 0 1px 1px #ccc; \n" +
    "} \n" +
    
    ".bordered tr:hover { \n" +
    "background: #fbf8e9; \n" +
    "    -o-transition: all 0.1s ease-in-out; \n" +
    "    -webkit-transition: all 0.1s ease-in-out; \n" +
    "    -moz-transition: all 0.1s ease-in-out; \n" +
    "    -ms-transition: all 0.1s ease-in-out; \n" +
    "transition: all 0.1s ease-in-out; \n" +
    "} \n" +
    
    ".bordered td, .bordered th { \n" +
    "    border-left: 1px solid #ccc; \n" +
    "    border-top: 1px solid #ccc; \n" +
    "padding: 10px; \n" +
    "    text-align: left; \n" +
    "} \n" +
    
    ".bordered th { \n" +
    "    background-color: #dce9f9; \n" +
    "    background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9)); \n" +
    "    background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9); \n" +
    "    background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9); \n" +
    "    background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9); \n" +
    "    background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9); \n" +
    "    background-image:         linear-gradient(top, #ebf3fc, #dce9f9); \n" +
    "    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; \n" +
    "    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset; \n" +
    "    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; \n" +
    "    border-top: none; \n" +
    "    text-shadow: 0 1px 0 rgba(255,255,255,.5); \n" +
    " } \n" +
    
    ".bordered td:first-child, .bordered th:first-child { \n" +
    "    border-left: none; \n" +
    "} \n" +
    
    ".bordered th:first-child { \n" +
    "    -moz-border-radius: 6px 0 0 0; \n" +
    "    -webkit-border-radius: 6px 0 0 0; \n" +
    "    border-radius: 6px 0 0 0; \n" +
    "} \n" +
    
    ".bordered th:last-child { \n" +
    "    -moz-border-radius: 0 6px 0 0; \n" +
    "    -webkit-border-radius: 0 6px 0 0; \n" +
    "    border-radius: 0 6px 0 0; \n" +
    "} \n" +
    
    ".bordered th:only-child{ \n" +
    "    -moz-border-radius: 6px 6px 0 0; \n" +
    "    -webkit-border-radius: 6px 6px 0 0; \n" +
    "    border-radius: 6px 6px 0 0; \n" +
    "} \n" +
    
    ".bordered tr:last-child td:first-child { \n" +
    "    -moz-border-radius: 0 0 0 6px; \n" +
    "    -webkit-border-radius: 0 0 0 6px; \n" +
    "    border-radius: 0 0 0 6px; \n" +
    "} \n" +
    
    ".bordered tr:last-child td:last-child { \n" +
    "    -moz-border-radius: 0 0 6px 0; \n" +
    "    -webkit-border-radius: 0 0 6px 0; \n" +
    "    border-radius: 0 0 6px 0; \n" +
    "} \n" +
    
    "</style> \n" +
    "</head> \n" +
"<body> \n"

let HTML_FOOTER = "</body>\n" +
"</html>\n"
