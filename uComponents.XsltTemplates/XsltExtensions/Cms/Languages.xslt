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

		<!-- Gets all languages definied in Umbraco -->
		<xsl:apply-templates select="ucomponents.cms:GetLanguages()" />

		<!-- Gets a single language from its Id -->
		<xsl:apply-templates select="ucomponents.cms:GetLanguage(1)" />

		<!-- Gets a single language from its culture-code -->
		<xsl:apply-templates select="ucomponents.cms:GetLanguageByCultureCode('en-US')" />

	</xsl:template>

	<!-- template to match any errors - this is rare, better to be safe than sorry -->
	<xsl:template match="error">
		<xmp>
			<xsl:copy-of select="."/>
		</xmp>
	</xsl:template>

	<!-- template to match multiple languages (from GetLanguages) -->
	<xsl:template match="Languages">
		<xsl:apply-templates select="Language" />
	</xsl:template>

	<!-- template to match an individual language -->
	<xsl:template match="Language">
		<div>
			<p>
				<strong>Friendly Name: </strong>
				<xsl:value-of select="@FriendlyName" />
			</p>
			<p>
				<strong>Id: </strong>
				<xsl:value-of select="@Id" />
			</p>
			<p>
				<strong>Culture: </strong>
				<xsl:value-of select="@CultureAlias" />
			</p>
		</div>
	</xsl:template>
	
</xsl:stylesheet>