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

		<!-- Gets all document-types definied in Umbraco -->
		<xsl:apply-templates select="ucomponents.cms:GetDocumentTypes(1, 0, 0)" />

		<!-- Gets a single document-type from its Id -->
		<xsl:apply-templates select="ucomponents.cms:GetDocumentType(1043, 1, 0, 0)" />

	</xsl:template>

	<!-- template to match any errors - this is rare, better to be safe than sorry -->
	<xsl:template match="error">
		<xmp>
			<xsl:copy-of select="."/>
		</xmp>
	</xsl:template>

	<!-- template to match multiple document-types (from GetDocumentTypes) -->
	<xsl:template match="DocumentTypes">
		<xsl:apply-templates select="DocumentType" />
	</xsl:template>

	<!-- template to match an individual document-type -->
	<xsl:template match="DocumentType">
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