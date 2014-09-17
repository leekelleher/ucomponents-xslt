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

		<!-- Gets all the macros defined in Umbraco -->
		<xsl:apply-templates select="ucomponents.cms:GetMacros()" />

		<!-- Gets a single macro from its alias name -->
		<xsl:apply-templates select="ucomponents.cms:GetMacro('Breadcrumbs')" />
		
	</xsl:template>

	<!-- template to match any errors - this is rare, better to be safe than sorry -->
	<xsl:template match="error">
		<xmp>
			<xsl:copy-of select="."/>
		</xmp>
	</xsl:template>

	<!-- template to match multiple macros (from GetMacros) -->
	<xsl:template match="macros">
		<xsl:apply-templates select="macro" />
	</xsl:template>

	<!-- template to match an individual macro -->
	<xsl:template match="macro">
		<div>
			<p>
				<strong>Name: </strong>
				<xsl:value-of select="name" />
			</p>
			<p>
				<strong>Alias: </strong>
				<xsl:value-of select="alias" />
			</p>
		</div>
	</xsl:template>
	
</xsl:stylesheet>