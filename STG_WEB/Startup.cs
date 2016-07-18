using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(STG_WEB.Startup))]
namespace STG_WEB
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
