<%@ WebHandler Language="C#" Class="KeepAlive" %>

using System.Web;
using System.Web.SessionState;

public class KeepAlive : IRequiresSessionState, IHttpHandler {

    public void ProcessRequest (HttpContext context) {

        //if (sessionext.getcurrentuser(context.session, context.request) == null)
        //{
        //      context.re("login.aspx");
        //}
        //else
        //{
        //    string username = sessionext.getcurrentuser(context.session, context.request).username;
        //    context.application[username] = "";
        //    sessionext.setcurrentuser(context.session, context.request, context.response, null, null);
        //    foreach (string cookie in context.response.cookies)
        //    {
        //        context.response.cookies[cookie].expires = system.datetime.now.adddays(-1);
        //    }
        //}
    }

    public bool IsReusable {
        get {
            return true;
        }
    }

}