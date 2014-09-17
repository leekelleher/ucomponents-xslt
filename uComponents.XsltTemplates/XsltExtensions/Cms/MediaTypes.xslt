<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library"
	xmlns:ucomponents.cms="urn:ucomponents.cms"
	exclude-result-prefixes="msxml umbraco.library ucomponents.cms">
	<xsl:output method="xml" omit-xml-declaration="yes"/>

	<xsl:param name="currentPage"/>

	<xsl:template match="/">

		<!-- Gets all media-types definied in Umbraco -->
		<xsl:apply-templates select="ucomponents.cms:GetMediaTypes(1, 0)" />

		<!-- Gets a single media-type from its Id -->
		<xsl:apply-templates select="ucomponents.cms:GetMediaTypes(1033, 1, 0)" />

	</xsl:template>

	<!-- template to match any errors - this is rare, better to be safe than sorry -->
	<xsl:template match="error">
		<xmp>
			<xsl:copy-of select="."/>
		</xmp>
	</xsl:template>

	<!-- template to match multiple media-types (from GetMediaTypes) -->
	<xsl:template match="MediaTypes">
		<xsl:apply-templates select="MediaType" />
	</xsl:template>

	<!-- template to match an individual media-type -->
	<xsl:template match="MediaType">
		<div>
			<p>
				<strong>Name: </strong>
				<xsl:value-of select="@name" />
			</p>
			<p>
				<strong>Alias: </strong>
				<xsl:value-of select="@alias" />
			</p>
		</div>
	</xsl:template>
	
</xsl:stylesheet>