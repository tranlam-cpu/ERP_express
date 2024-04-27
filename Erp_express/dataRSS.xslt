<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="xml" indent="yes"/>

    <xsl:template match="@* | node()">
        <items>
          <xsl:for-each select="//item">
            <item Name="{position()}" HeaderText="{title}" Text="{description}" NavigateUrl="{position()}" Date="{pubDate}" ImageUrl="{image/url}" />
          </xsl:for-each>
        </items>
    </xsl:template>


</xsl:stylesheet>
