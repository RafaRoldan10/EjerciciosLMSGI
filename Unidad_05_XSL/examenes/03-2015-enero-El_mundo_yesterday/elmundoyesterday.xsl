<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

  <xsl:template match="/periodico">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
          <title><xsl:value-of select="@nombre"/></title>
          <xsl:call-template name="css"/>
      </head>
      <body>
        <div style="width: 1000px; margin: 0 auto;">
          <div style="width: 1000px;"><img src="{@logo}" width="997" height="115"/></div>
          <div id="menu" style="width: 1000px; margin: 0px; padding: 0px;">
            <ul>
              <xsl:for-each select="menu/enlace">
                <li>
                  <xsl:choose>
                    <xsl:when test="position() mod 2 = 1">
                      <xsl:attribute name="style">background:#DDE640;</xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:attribute name="style">background:orange;</xsl:attribute>
                    </xsl:otherwise>
                  </xsl:choose>
                  <a href="#"><xsl:value-of select="."/></a></li>
              </xsl:for-each>
            </ul>
          </div>
          <div style="width: 700px; float: left;">
            <div class="noticiaDobleAncho">
              <h2>Se�ora de Badajoz confunde a todos los hombres negros con Morgan Freeman</h2>
              <h4>"Est� en todos los saraos este hombre" - dice la se�ora</h4><img src="http://webdidacticarafaelmunoz.appspot.com/lmsgi/ejercicios-cap5/examen/2015-enero/recursos/badajoz.jpg"/><br/><span class="fechaNoticia">
                Publicado el 22 de febrero</span><span class="comentariosNoticia">10 comentarios
                </span></div>
            <div class="noticia">
              <h2>El Observatorio de la Mujer controlar� a Uma Thurman v�a sat�lite para detectar el
                menor cambio en su aspecto
              </h2>
              <h4>El rostro de la actriz ya es la primera preocupaci�n de los espa�oles por encima del
                paro y el terrorismo
              </h4><img src="http://webdidacticarafaelmunoz.appspot.com/lmsgi/ejercicios-cap5/examen/2015-enero/recursos/umagumma.jpg"/><br/><span class="fechaNoticia">
                Publicado el 21 de febrero</span><span class="comentariosNoticia">13 comentarios
                </span></div>
            <div class="noticia">
              <h2>Aumenta la producci�n de uvas gigantes para esas botellas de vino gigantes que hay
                en los restaurantes
              </h2>
              <h4>Los decantadores son hormigoneras</h4><img src="http://webdidacticarafaelmunoz.appspot.com/lmsgi/ejercicios-cap5/examen/2015-enero/recursos/uvasgigantes.jpg"/><br/><span class="fechaNoticia">
                Publicado el 20 de febrero</span><span class="comentariosNoticia">20 comentarios
                </span></div>
            <div class="noticiaDobleAncho">
              <h2>Un cirujano interrumpe un transplante de coraz�n para ver un videotutorial sobre transplantes
                de coraz�n
              </h2>
              <h4>Tambi�n busc� trucos en Youtube para comunicar el fallecimiento</h4><img src="http://webdidacticarafaelmunoz.appspot.com/lmsgi/ejercicios-cap5/examen/2015-enero/recursos/transplante.png"/><br/><span class="fechaNoticia">
                Publicado el 19 de febrero</span><span class="comentariosNoticia">20 comentarios
                </span></div>
          </div>
          <div style="width: 295px; float: right;">
            <div class="divPublicidad"><img width="280px" src="http://webdidacticarafaelmunoz.appspot.com/lmsgi/ejercicios-cap5/examen/2015-enero/recursos/publi-sanitas.png"/></div>
            <div class="divPublicidad"><img width="280px" src="http://webdidacticarafaelmunoz.appspot.com/lmsgi/ejercicios-cap5/examen/2015-enero/recursos/publi-arriba.png"/></div>
            <div class="divPublicidad"><img width="280px" src="http://webdidacticarafaelmunoz.appspot.com/lmsgi/ejercicios-cap5/examen/2015-enero/recursos/publi-sofa.png"/></div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>

 
 
  <xsl:template name="css">
    <style type="text/css">
      body {
      font-family: Arial;
      font-size: 12px;
      }
      
      ol, ul
      {
      margin-top: 10px;
      margin-left: 0px;
      }
      
      #menu li
      {
      margin-left: 0px;
      display: inline;
      list-style-type: none;
      padding: 10px 50px;
      }
      
      .noticia {
      /* border: #000 solid 1px; */
      padding: 10px 5px;
      float: left; 
      width: 338px;
      }
      
      .noticia img {
      width: 338px;
      }
      
      .noticiaDobleAncho {
      /* border: #000 solid 1px; */
      padding: 10px 5px;
      float: left; 
      width: 690px;
      }
      
      .noticiaDobleAncho img {
      width: 690px;
      }
      
      .fechaNoticia {
      color: #A3A34B;
      }
      
      .comentariosNoticia {
      color: #A3A34B;
      padding-left: 20px;
      }
      
      .divPublicidad {
      /* border: #000 solid 1px; */
      padding: 10px 5px;
      float: right; 
      width: 280px;                    
      }
      
      .divPublicidad img {
      width: 200px;
      }
    </style>
  </xsl:template>
 
</xsl:stylesheet>
