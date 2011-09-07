<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY empty "not(normalize-space())">
]>
<!-- 
	multiline-helper.xslt
	ucomponents-xslt

	Helper templates for rendering the uComponents "Multiple TextString" datatype

	Usage:
		Include this file in any XSLT file using <xsl:include href="multiline-helper.xslt" /> and in your
		main XSLT file just apply templates to any Multiple TextString property you want to render, like this: 
		
		<xsl:apply-templates select="propertyName" mode="multiline" />
		
		You will get a paragraph for every line added to the property.
		
-->
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:umb="urn:umbraco.library"
	exclude-result-prefixes="umb"
>

	<xsl:template match="*" mode="multiline">
		<xsl:apply-templates select="values/value" />
	</xsl:template>
	
	<xsl:template match="values/value">
		<p>
			<xsl:value-of select="." />
		</p>
	</xsl:template>
	
	<!-- Suppress empty values -->
	<xsl:template match="values/value[&empty;]" priority="1" />
	
</xsl:stylesheet>