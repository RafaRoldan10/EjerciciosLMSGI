<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

  <xsl:template match="/primerDia1DAW">
    <html>
      <head>
        <title>Primer día 1º DAW</title>
        <style type="text/css">
          td {
            width: 60px;
            height: 60px;
          }
          img {
            width: 40px;
          }
        </style>
      </head>
      <body>
        <table border="1" width="80%" align="center">
          <xsl:call-template name="bucleForFila">
            <xsl:with-param name="i">1</xsl:with-param>
          </xsl:call-template>
        </table>
      </body>
    </html>
  </xsl:template>


  <xsl:template name="bucleForFila">
    <xsl:param name="i"/>
    <xsl:if test="$i &lt;= 11">
      <tr>
        <xsl:call-template name="bucleForColumna">
          <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
          <xsl:with-param name="j">1</xsl:with-param>
        </xsl:call-template>
      </tr>
      <xsl:call-template name="bucleForFila">
        <xsl:with-param name="i"><xsl:value-of select="$i + 1"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  
  
  <xsl:template name="bucleForColumna">
    <xsl:param name="i"/>
    <xsl:param name="j"/> 
    <xsl:if test="$j &lt;= 8">
      <xsl:call-template name="celda">
        <xsl:with-param name="x"><xsl:value-of select="$j"/></xsl:with-param>
        <xsl:with-param name="y"><xsl:value-of select="$i"/></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="bucleForColumna">
        <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
        <xsl:with-param name="j"><xsl:value-of select="$j + 1"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  
  
  <xsl:template name="celda">
    <xsl:param name="x"/>
    <xsl:param name="y"/>
    <td>
      <xsl:for-each select="estructuraAula/bloque">
        <xsl:if test="$x = @x and $y = @y">
          <xsl:variable name="tipoBloque"><xsl:value-of select="@tipo"/></xsl:variable>
          <xsl:attribute name="style">background: #<xsl:value-of select="/primerDia1DAW/estructuraAula/color[@tipo=$tipoBloque]"/>;</xsl:attribute>
          <xsl:value-of select="@tipo"/>
        </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="/primerDia1DAW/alumnado/alumno">
        <xsl:if test="$x = @x and $y = @y">
          <xsl:attribute name="style">
          <xsl:choose>
            <xsl:when test="@sexo = 'M'">background:lightgreen;</xsl:when>
            <xsl:otherwise>background:orange;</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <xsl:variable name="sexoAlumno"><xsl:value-of select="@sexo"/></xsl:variable>
          <img src="{/primerDia1DAW/alumnado/imagen[@sexo=$sexoAlumno]}"/>
          <br/><xsl:value-of select="."/>
        </xsl:if>
      </xsl:for-each>
    </td>
  </xsl:template>
  
  

</xsl:stylesheet>










