<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="html"
>

    <xsl:output
        method="text"
    />

    <xsl:template match="//body">
        <xsl:apply-templates select="//a">
            <xsl:sort select="@href"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="//a[contains(@class, 'lend prime')] | //a[contains(@class, 'reserve')]">
        <xsl:value-of select="@href"/><xsl:text> </xsl:text><xsl:value-of select="@title"/>
        <xsl:text>
</xsl:text>
    </xsl:template>

    <xsl:template match="text()"/> <!-- remove all text -->
</xsl:stylesheet>
