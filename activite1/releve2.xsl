<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Releve Bancaire</title>
            </head>
            <body>
                <h3>les opérations de type CREDIT d’un relevé bancaire</h3>
                <table border="1" width="70%">
                    <thead>
                        <tr>
                            <th>Description</th>
                            <th>Date</th>
                            <th>Type</th>
                            <th>Montant</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="releve/operations/operation[@type='CREDIT']">
                            <tr>
                                <td><xsl:value-of select="@description"/></td>
                                <td><xsl:value-of select="@date"/></td>
                                <td><xsl:value-of select="@type"/></td>
                                <td><xsl:value-of select="@montant"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>