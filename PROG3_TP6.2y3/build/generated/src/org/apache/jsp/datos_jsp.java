package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.sun.javafx.scene.control.skin.VirtualFlow.ArrayLinkedList;
import java.util.List;
import java.util.ArrayList;
import Controlador.PersonaGestor;
import Modelo.Persona;

public final class datos_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>DATOS</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            PersonaGestor pg = new PersonaGestor();
            List<Persona> personas = pg.dameListaPersonas();
        
      out.write("\n");
      out.write("        <h2>Registro de personas:</h2>\n");
      out.write("        <table border=\"1\" style=\"width: 50%; height: 5%; text-align: center\">\n");
      out.write("            ");

                out.println("<tr>");
                out.println("<td>"+"DNI"+"</td>");
                out.println("<td>"+"NOMBRE"+"</td>");
                out.println("<td>"+"DOMICILIO"+"</td>");
                out.println("</tr>");
                for (Persona p : personas) {
                    out.println("<tr>");
                    out.println("<td>"+p.getDni()+"</td>");
                    out.println("<td>"+p.getNombre()+"</td>");
                    out.println("<td>"+p.getDomicilio()+"</td>");
                    out.println("</tr>");
                }
            
      out.write("\n");
      out.write("        </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
