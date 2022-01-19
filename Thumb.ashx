<%@ WebHandler Language="C#" Class="Thumb" %>

using System;
using System.Web;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;

public class Thumb : IHttpHandler {
    private readonly static TimeSpan CACHE_DURATION = TimeSpan.FromDays(30);
    public void ProcessRequest(HttpContext context) {
        
            string photoName = context.Request.QueryString["file"];
            if (context.Request.QueryString["s"].ToString() == "a") {

                using (Image tempImage = new Bitmap(context.Server.MapPath("~" + "/js/transparent.png")))
        {
          
            tempImage.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Png);
                
            }
                 return;
            }
           int size = Convert.ToInt16(context.Request.QueryString["s"]);

           HttpCookie cookie = HttpContext.Current.Request.Cookies["sizescreen"];
           if (cookie != null)
           {
               if (Convert.ToInt32(cookie.Value) < 1300)
               {
                   if (size > Convert.ToInt32(cookie.Value))
                   {
                       size = Convert.ToInt32(cookie.Value);
                   }
               }
           }
       // HttpCookie cookie = HttpContext.Current.Request.Cookies["sizescreen"];
      //  int size = Convert.ToInt32(cookie.Value);
       // string photoPath = context.Server.MapPath(System.IO.Path.Combine(FakeDataHelper.PhotosFolder, photoName));
        Image img= null;
        string photoPath = photoName;

        if (photoName.Contains("http://") || photoName.Contains("https://"))
           {
               if (photoName.StartsWith("/")) photoName = photoName.Substring(1, photoName.Length - 1);
              img= StyleSoftware.ThuVienXuLyAnh.LoadPicture(photoName);
           }
           else
           {

              photoPath = context.Server.MapPath("~" + photoName);
               if (File.Exists(photoPath))
               {
                   img = Image.FromFile(photoPath);
               }
           }
                     using (Bitmap thumb = ChangeImageSize(img, size))
                   {

                        byte[] buffer;
                        using (MemoryStream ms = new MemoryStream()) {
                        // thumb.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);

                            using (Stream writer =
                    (Stream)(new System.IO.Compression.GZipStream(ms, System.IO.Compression.CompressionMode.Compress)))
                            {


                                //  context.Response.ContentType = "image/png";
                                //  context.Response.BinaryWrite(buffer);
                               // HttpResponse response = context.Response;
                                if (photoPath.Contains("png"))
                                {
                                    //  thumb.Save(response.OutputStream, System.Drawing.Imaging.ImageFormat.Png);
                                    //thumb.Save(writer, System.Drawing.Imaging.ImageFormat.Png);

                                    //  context.Response.ContentType = "image/png";
                                    System.Drawing.Imaging.ImageCodecInfo[] codecs = System.Drawing.Imaging.ImageCodecInfo.GetImageEncoders();
                                   
                                    System.Drawing.Imaging.EncoderParameter qualityParam = new System.Drawing.Imaging.EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 60L);

                                   


                                    System.Drawing.Imaging.EncoderParameters encoderParams = new System.Drawing.Imaging.EncoderParameters(1);


                                    encoderParams.Param[0] = qualityParam;



                                    thumb.Save(writer, codecs[4], encoderParams);
                                    context.Response.ContentType = "image/png";
                                }
                                else
                                {
                                    //    thumb.Save(response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                                    //thumb.Save(writer, System.Drawing.Imaging.ImageFormat.Jpeg);

                                    //context.Response.ContentType = "image/jpeg";

                                    System.Drawing.Imaging.ImageCodecInfo[] codecs = System.Drawing.Imaging.ImageCodecInfo.GetImageEncoders();
                                  
                                  
                                       System.Drawing.Imaging.EncoderParameter qualityParam = new System.Drawing.Imaging.EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 75L);
                                     if (size < 400)
                                       {
                                           qualityParam = new System.Drawing.Imaging.EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 80L);
                                       }
                                       if (size < 150)
                                       {
                                           qualityParam = new System.Drawing.Imaging.EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 100L);
                                       }



                                    System.Drawing.Imaging.EncoderParameters encoderParams = new System.Drawing.Imaging.EncoderParameters(1);


                                    encoderParams.Param[0] = qualityParam;



                                    thumb.Save(writer, codecs[1], encoderParams);
                                    context.Response.ContentType = "image/jpeg";
                                    
                                }
                                writer.Close();
                            }
                       buffer = ms.ToArray();
                       //  if (isCompressed)
                       context.Response.AppendHeader("Content-Encoding", "gzip");

                       //    if (!Styles.Util.ConstantHelper.DeveloperMode)
                       //    {
                       context.Response.Cache.SetCacheability(HttpCacheability.Public);
                       context.Response.Cache.SetExpires(DateTime.Now.Add(CACHE_DURATION));
                       context.Response.Cache.SetMaxAge(CACHE_DURATION);
                       //  }

                       context.Response.Cache.AppendCacheExtension("must-revalidate, proxy-revalidate");

                       context.Response.OutputStream.Write(buffer, 0, buffer.Length);
                         context.Response.Flush();
                        }
                   }

               
           
    }

    public bool IsReusable { get { return true; } }

    Bitmap ChangeImageSize(Image original, int width) {

        
        int newWidth = width;

        int newHeight = (int)(original.Height * ((double)width / original.Width));
        if (original.Width <= width) {
           // newWidth = original.Width-20;
           // newHeight = (int)(original.Height * ((double)(original.Width - 20) / original.Width));
          //  newWidth = original.Width;
           // newHeight = original.Height;
            return new Bitmap(original);
        }
        Bitmap thumbnail = new Bitmap(newWidth, newHeight);
        if (width < 120)
        {

            Image resize = StyleSoftware.ThuVienXuLyAnh.ResizePicFromImageHeightCenter(original, width);
            MemoryStream stream = new MemoryStream();
            resize.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
            thumbnail = new Bitmap(stream);
        }
        else
        {
            Graphics g = Graphics.FromImage(thumbnail);
            g.InterpolationMode = InterpolationMode.HighQualityBicubic;
            g.DrawImage(original, 0, 0, newWidth, newHeight);
        }
        return thumbnail;
    }
}