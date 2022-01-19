﻿<%@ WebHandler Language="C#" Class="Scripts" %>

using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Web;
using System.Net;


using Styles.Web.Util.Dropthings.Web.Util;

public class Scripts : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        string fullurl = context.Request.Url.ToString();
        string baseUrl = fullurl.Substring(0, fullurl.IndexOf(HttpUtility.UrlDecode(context.Request.Url.PathAndQuery)));

        string queryString = HttpUtility.UrlDecode(context.Request.QueryString.ToString());
        if (queryString == "")
            return;
        //   string[] urlSplit = queryString.Split('&');

        string setInfo = "CombineScript.BE" + queryString.Split('=')[1];
        string urlPrefix = "";

        //  string[] tokens = setInfo.Split('=');
        //    string setName = tokens[0];
        //  string[] urlMaps = tokens[1].Split(',');

        byte[] encodedBytes;
        string urlScheme = context.Request.Url.GetComponents(UriComponents.SchemeAndServer, UriFormat.Unescaped);
          //if (Styles.Util.Services.Get<OmarALZabir.AspectF.ICache>().Get(setInfo) == null || ( urlScheme.Contains("localhost")))
        //if (Styles.Util.Services.Get<OmarALZabir.AspectF.ICache>().Get(setInfo) == null )
        //   { 

        // Find the set
        //Styles.Web.Util.Dropthings.Web.Util.UrlMapSet set = Styles.Web.Util.Dropthings.Web.Util.CombineScripts.LoadSetss(baseUrl).Find(
        //    new Predicate<UrlMapSet>(delegate(UrlMapSet match)
        //        {
        //            return match.Name == setName;
        //        }));
       // Styles.Web.Util.Dropthings.Web.Util.UrlMapSet set = Styles.Web.Util.Dropthings.Web.Util.CombineScripts.LoadSetss(baseUrl)[0];
       // if (fullurl.ToLower().Contains("systemstyles"))
       // {
          Styles.Web.Util.Dropthings.Web.Util.UrlMapSet set  = Styles.Web.Util.Dropthings.Web.Util.CombineScripts.LoadSets(baseUrl)[0];
       // }

        // Find the URLs requested to be rendered            
        //List<UrlMap> maps = string.IsNullOrEmpty(tokens[1]) ? set.Urls 
        //    : set.Urls.FindAll(new Predicate<UrlMap>(delegate(UrlMap map)
        //        {
        //            return Array.BinarySearch<string>(urlMaps, map.Name) >= 0;
        //        }));
        List<UrlMap> maps = set.Urls;

       

        StringBuilder buffer = new StringBuilder();
        foreach (UrlMap map in maps)
        {
            /*
             * Urls can be in one of the following formats:
             * a) Relative url to the page
             * b) Relative url starting with application path e.g. /Dropthings/....
             * c) Absolute url with http:// prefix
             */
            if (urlScheme.Contains("localhost") && context.Request.Url.ToString().Contains("StylesDrop.Interface"))
            {
                urlScheme = urlScheme.Replace("/StylesDrop.Interface", "");
                urlScheme = urlScheme + "/StylesDrop.Interface";
            }
            string fullUrl = map.Url;
            if (map.Url.StartsWith("http://")) fullUrl = map.Url;
            else if (map.Url.StartsWith(context.Request.ApplicationPath)) fullUrl = urlScheme + map.Url;
            else fullUrl = urlScheme + urlPrefix + map.Url;

            string mapUrlForJS = HttpUtility.HtmlDecode(map.Url).Replace("'", "\'");
            HttpWebRequest request = this.CreateHttpWebRequest(fullUrl);
            try
            {
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    if (response.StatusCode == HttpStatusCode.OK)
                    {
                        using (StreamReader reader = new StreamReader(response.GetResponseStream()))
                        {
                            string responseContent = reader.ReadToEnd();
                            buffer.Append(responseContent);
                            buffer.Append(Environment.NewLine);
                            buffer.Append(@"
                            if(typeof(Sys)!=='undefined') Array.add(Sys._ScriptLoader._getLoadedScripts(), '" + fullUrl + @"'); 
                            if( !window._combinedScripts ) { window._combinedScripts = []; } 
                            window._combinedScripts.push('" + fullUrl + @"');");
                            buffer.Append(Environment.NewLine);
                        }
                    }
                    else
                    {
                        buffer.Append("alert(\"Cannot load script from:" + mapUrlForJS + ". Please correct mapping for '" + map.Name + "' in App_Data\\\\FileSets.xml\");");
                        buffer.Append(Environment.NewLine);
                    }
                }
            }
            catch
            {
                buffer.Append("alert(\"Cannot load script from:" + mapUrlForJS + ". Please correct mapping for '" + map.Name + "' in App_Data\\\\FileSets.xml\");");
                buffer.Append(Environment.NewLine);
            }
        }

        string responseString = buffer.ToString();
       
        encodedBytes = context.Request.ContentEncoding.GetBytes(responseString);
     //   Styles.Util.Services.Get<OmarALZabir.AspectF.ICache>().Add(setInfo, encodedBytes, DateTime.Now.AddMinutes(10) - DateTime.Now);
    //    Styles.Util.Services.Get<OmarALZabir.AspectF.ICache>().Add(setInfo, encodedBytes);
          // }
          //else
          //{
          //    encodedBytes = Styles.Util.Services.Get<OmarALZabir.AspectF.ICache>().Get(setInfo) as byte[];
          //}

        context.Response.ContentType = "text/javascript";
        context.Response.ContentEncoding = context.Request.ContentEncoding;
        context.Response.Cache.SetMaxAge(TimeSpan.FromDays(30));
        context.Response.Cache.SetExpires(DateTime.Now.AddDays(30));
        context.Response.Cache.SetCacheability(HttpCacheability.Private);
        context.Response.AppendHeader("Content-Length", encodedBytes.Length.ToString());

        context.Response.OutputStream.Write(encodedBytes, 0, encodedBytes.Length);
        context.Response.Flush();
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

    private HttpWebRequest CreateHttpWebRequest(string url)
    {
        HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
        request.Headers.Add("Accept-Encoding", "gzip");
        request.AutomaticDecompression = DecompressionMethods.GZip;
        request.MaximumAutomaticRedirections = 2;
        request.MaximumResponseHeadersLength = 4 * 1024;
        request.ReadWriteTimeout = 1 * 1000;
        request.Timeout = 5 * 1000;

        return request;
    }
}