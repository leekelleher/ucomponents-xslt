<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />

	<xsl:template match="MultiPickerTestNode">
		<p><xsl:value-of select="name" /></p>
	</xsl:template>

	<xsl:include href="../uComponents.XsltTemplates/urlpicker-helper.xslt" />	
	<xsl:include href="../uComponents.XsltTemplates/multiline-helper.xslt" />
	<xsl:include href="../uComponents.XsltTemplates/multipicker-helper.xslt" />

</xsl:stylesheet>