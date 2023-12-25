<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Relevés de Comptes Bancaires</title>
            </head>
            <body>
                <h3>Releve Bancaire du Compte: <xsl:value-of select="/releve/@RIB"/></h3>
                <h3>Date Releve: <xsl:value-of select="/releve/dateReleve"/></h3>
                <h3>Solde: <xsl:value-of select="/releve/solde"/></h3>
                <p><xsl:value-of select="/releve/operations/@dateDebut"/> - <xsl:value-of select="/releve/operations/@dateFin"/></p>
                <table border="1" width="70%">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Type</th>
                            <th>Montant</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="releve/operations/operation[@type='DEBIT']">
                            <tr>
                                <td><xsl:value-of select="@date"/></td>
                                <td><xsl:value-of select="@type"/></td>
                                <td><xsl:value-of select="@description"/></td>
                                <td><xsl:value-of select="@montant"/></td>
                            </tr>
                        </xsl:for-each>
                        <tr style="background-color: #d3d3d3;">
                            <td colspan="3">Total Débit</td>
                            <td><xsl:value-of select="sum(releve/operations/operation[@type='DEBIT']/@montant)"></xsl:value-of></td>
                        </tr>
                        <xsl:for-each select="releve/operations/operation[@type='CREDIT']">
                            <tr>
                                <td><xsl:value-of select="@date"/></td>
                                <td><xsl:value-of select="@type"/></td>
                                <td><xsl:value-of select="@description"/></td>
                                <td><xsl:value-of select="@montant"/></td>
                            </tr>
                        </xsl:for-each>
                        <tr style="background-color: #d3d3d3;">
                            <td colspan="3">Total Crédit</td>
                            <td><xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"></xsl:value-of></td>
                        </tr>
                        <tr style="background-color: #ADD8E6;">
                            <td colspan="3">Total des Montant</td>
                            <td><xsl:value-of select="sum(releve/operations/operation/@montant)"></xsl:value-of></td>
                        </tr>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>