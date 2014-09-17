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

		<!-- Gets all data-types definied in Umbraco -->
		<xsl:apply-templates select="ucomponents.cms:GetDataTypes()" />

		<!-- Gets a single data-type from its Id -->
		<xsl:apply-templates select="ucomponents.cms:GetDataTypeById(-87)" />

		<!-- Gets a single data-type from its Guid -->
		<xsl:apply-templates select="ucomponents.cms:GetDataTypeByGuid('5e9b75ae-face-41c8-b47e-5f4b0fd82f83')" />

	</xsl:template>

	<!-- template to match any errors - this is rare, better to be safe than sorry -->
	<xsl:template match="error">
		<xmp>
			<xsl:copy-of select="."/>
		</xmp>
	</xsl:template>

	<!-- template to match multiple data-types (from GetDataTypes) -->
	<xsl:template match="DataTypes">
		<xsl:apply-templates select="DataType" />
	</xsl:template>

	<!-- template to match an individual data-type -->
	<xsl:template match="DataType">
		<div>
			<p>
				<strong>Name: </strong>
				<xsl:value-of select="@Name" />
			</p>
		</div>
	</xsl:template>
	
</xsl:stylesheet>