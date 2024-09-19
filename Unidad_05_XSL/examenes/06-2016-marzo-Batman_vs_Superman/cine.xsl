<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

  <xsl:template match="/cine">
    <html>
      <head>
        <title><xsl:value-of select="@nombre"/></title>
        <style type="text/css">
          <xsl:call-template name="css"></xsl:call-template>
        </style>
      </head>
      <body>
        <div style="width: 1000px; margin: 0 auto;"> 
      	  <h1><xsl:value-of select="@nombre"/></h1>
          <xsl:apply-templates select="titulo"></xsl:apply-templates>
      	</div>
        <table border="1" width="100%" align="center">
          <xsl:apply-templates select="/cine/sesiones/sesion"></xsl:apply-templates>
        </table>
        <table border="1" width="50%" align="center" >
          <th>Nombre</th>
          <th>Imagen</th>
          <xsl:apply-templates select="cartelera"></xsl:apply-templates>
        </table>
      </body>
    </html>
  </xsl:template>
   <xsl:template name="css">
     body {
     font-family: Arial;
     font-size: 12px;
     }
  </xsl:template>

  <xsl:template match="titulo">
    <img src="{imagen/.}" width="500px"></img><h2><xsl:value-of select="@nombre"/></h2>
    <h3>
      Estreno:
      <xsl:value-of select="@estreno"/>
    </h3>
  </xsl:template>
  
  <xsl:template match="sesion">
    <tr>
      <td>
        <xsl:if test="position() mod 2 = 1">
          <xsl:attribute name="style">background-color: #dbf7ff;</xsl:attribute>
        </xsl:if>
        Sesion <xsl:value-of select="position()"/> : <xsl:value-of select="@hora"/>
        <table border="1" width="50%" align="center">
          <xsl:call-template name="bucleForFila">
            <xsl:with-param name="i">1</xsl:with-param>
          </xsl:call-template>
        </table>
        
      </td>
    </tr>
  </xsl:template>
  
  <xsl:template name="bucleForFila">
    <xsl:param name="i"/>
    <xsl:if test="$i &lt;= 4">
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
    <xsl:if test="$j &lt;= 4">
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
      <xsl:choose>
        <xsl:when test="ocupado[$y = @asiento and $x = @fila]">
          <img src="{/cine/imagenes/imagen[@id='ocupado']}"></img>
        </xsl:when>
        <xsl:otherwise>
          <img src="{/cine/imagenes/imagen[@id='libre']}"></img>
        </xsl:otherwise>
      </xsl:choose>
    </td>
  </xsl:template>
  
  <xsl:template match="cartelera">
    <xsl:for-each select="pelicula">
      <tr>
        <td><xsl:value-of select="@nombre"/></td>
        <td><xsl:variable name="idpelicula"><xsl:value-of select="@id"/></xsl:variable>
          
          <img src="{../../imagenes/imagen[$idpelicula=@id]/.}"/></td>
      </tr>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
