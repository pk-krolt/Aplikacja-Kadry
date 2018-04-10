using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SZRBD.Kadry.Startup))]
namespace SZRBD.Kadry
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
