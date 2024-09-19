<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

  <xsl:template match="/primerDia1DAW">
    <html>
      <head>
        <title>Primer día 1º DAW</title>
      </head>
      <body>
        <table border="1" align="center" width="80%">
          <xsl:apply-templates select="horario/dia" />
        </table>
      </body>
    </html>
  </xsl:template>


  <xsl:template match="horario/dia">
    <tr>
      <td><xsl:value-of select="@desc"/></td>
      <xsl:for-each select="hora">
        <xsl:sort select="@orden"/>
        <xsl:call-template name="celdaConColor">
          <xsl:with-param name="materia">
            <xsl:value-of select="."/>
          </xsl:with-param>
          <xsl:with-param name="color">
            <xsl:choose>
              <xsl:when test="position() mod 2 = 1">lightblue;</xsl:when>
              <xsl:otherwise>white;</xsl:otherwise>
            </xsl:choose>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
    </tr>
  </xsl:template>
  
  <xsl:template name="celdaConColor">
    <xsl:param name="color"/>
    <xsl:param name="materia"/>
    <td style="background:{$color};">
      <xsl:value-of select="$materia"/>
    </td>
  </xsl:template>
</xsl:stylesheet>










