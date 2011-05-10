<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY NiceUrl "string">
]>
<!-- 
	urlpicker-helper.xslt
	ucomponents-xslt

	Helper templates for rendering the uComponents url-picker

	Usage:
		Include this file in any XSLT file using <xsl:include href="urlpicker-helper.xslt" /> and in your
		main XSLT file just apply templates to any url-picker property you want to render, like this: 
		
		<a>
			<xsl:apply-templates select="propertyName" mode="urlpicker" />
			<xsl:text>Click Me!</xsl:text>
		</a>
		
		Note: These templates just create the *attributes* (href, title and target). This is so you can
		provide the link text and any other attributes (like class="" or rel="") if you need to.

		If you use the Multi-URL Picker, you won't need a wrapper - you'll get a nice <ul> with a link
		for every picker that was added to it. It'll use the contents of the link-title for the link text. 
		
-->
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:umb="urn:umbraco.library"
	exclude-result-prefixes="umb"
>

	<xsl:output method="html" indent="yes" omit-xml-declaration="yes" />
	
	<xsl:template match="*" mode="urlpicker">
		<xsl:apply-templates select="url-picker[normalize-space(url)]" />
	</xsl:template>
	
	<xsl:template match="*[multi-url-picker]" mode="urlpicker">
		<ul>
			<xsl:for-each select="multi-url-picker/url-picker">
				<li>
					<a>
						<xsl:apply-templates select="." />
						<xsl:value-of select="link-title" />
					</a>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>

	<xsl:template match="url-picker">
		<!-- 'Mutually Exclusive' hack - use <node-id> OR <url> -->
		<xsl:apply-templates select="self::url-picker[@mode = 'Content']/node-id[normalize-space()]" />
		<xsl:apply-templates select="self::url-picker[not(@mode = 'Content')]/url[normalize-space()]" />
		
		<!-- If a title was specified, generate a title attribute -->
		<xsl:apply-templates select="link-title[normalize-space()]" />
		
		<!-- Only need to cater for the ones that have the value True in here -->
		<xsl:apply-templates select="new-window[. = 'True']" />
	</xsl:template>
	
	<!--
		The following templates are scoped to the url-picker to ensure that they won't conflict
		with any other included templates
	-->
	<xsl:template match="url-picker/url">
		<xsl:attribute name="href">
			<xsl:value-of select="." />
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="url-picker/node-id">
		<xsl:attribute name="href">
			<xsl:value-of select="&NiceUrl;(.)" />
		</xsl:attribute>
	</xsl:template>

	<xsl:template match="url-picker/link-title">
		<xsl:attribute name="title">
			<xsl:value-of select="." />
		</xsl:attribute>
	</xsl:template>

	<xsl:template match="url-picker/new-window">
		<xsl:attribute name="target">_blank</xsl:attribute>
	</xsl:template>

</xsl:stylesheet>