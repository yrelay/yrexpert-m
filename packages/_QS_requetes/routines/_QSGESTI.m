;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     : %QSGESTI                                                     !
;! Module      : %QS (     )                                                  !
;! But         : A/M/S une valeur d'un attribut d'un individu.                !
;!                                                                            !
;! Description :                                                              !
 ;
 ; QUI        - Nom de la base de données utilisateur
 ;
 ; Paramètre d'entrée
 ; ==================
 ; %U7  - Nom du répertoire dans le shéma de données
 ; %CUK - Nom de l'individu dans le répertoire
 ; %UP  - Nom de l'attribut de l'individu
 ; %UV  - Valeur à affecter à ATTRIBUT(INDICE)
 ; %UN  - Nom de l'indice de l'atribut
 ;
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QSGESTI^INT^1^59547,73882^0
%QSGESTI ;
 
 
 
 
 
 
 
 
 
 
 
SAH(%U7,%CUK,%UP) ;supprime tous les indices d'un attribut
 I '($D(^[QUI]RQSLIEN(%U7,%UP))) D PSV(%U7,%CUK,%UP) Q
 I $P(^[QUI]RQSLIEN(%U7,%UP),"^",1)=2 D SAHH,PSV(%U7,%CUK,%UP)
 Q
SAHH N %NU7,%UV,UV,UN,%UN
 S %NU7=$P(^[QUI]RQSLIEN(%U7,%UP),"^",2),UN=""
 F %UN=0:0 S UN=$O(^[QUI]QUERYV(%U7,%CUK,%UP,UN)) Q:%UV=""  S %UV=^[QUI]QUERYV(%U7,%CUK,%UP,UN) D SX^%QSGESTK(%NU7,%CUK_","_%UV)
 Q
 
 
SX(%U7,%CUK) 
 N A,%A,%IU7,V,M,R,ORIGINE,NG,O,%O
 Q:(%U7="")!(%CUK="")
 S A="" F %A=0:0 S A=$O(^[QUI]RQSLIEN(%U7,A)) Q:A=""  S %IU7=^[QUI]RQSLIEN(%U7,A) I $P(%IU7,"^",1)=2 S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(%U7,%CUK,A,O)) Q:O=""  S V=^[QUI]QUERYV(%U7,%CUK,A,O) D SX($P(%IU7,"^",2),%CUK_","_V),SUP^%QSGES18(%U7,%CUK)
 Q
 
 
 
 
 
STOCK(%U7,%CUK,%UP,%UV,%UN) ;affecte une valeur à l'attribut d'un individu. 
 Q:'($$FINT^%QMDAUC(%U7,%UP,.%UV))
 G AJOUT
 

 
PA(%U7,%CUK,%UP,%UV,%UN)
 ;
 ;PA affecte une valeur à l'attribut d'un individu.
 ; test AJOUT : view "LINK":"RECURSIVE" zl "_QSGESTI" S QUI="DMO",WHOIS="DMO",WHOIS("ETUDE")=0,OKQUI=$$ZDIRECTORY^%GTM(QUI) d PA^%QSGESTI("BAC.A.SABLE","DEFAUT","DESCRIPTION","TEST",1)

AJOUT 
A N TYPE,%OOUV
 
 S:'($D(%UN)) %UN=1 Q:((((%U7="")!(%CUK=""))!(%UP=""))!(%UV=""))!(%UN="")
 I $D(^TOZE($I,"CARSPE")),^TOZE($I,"CARSPE") S %U7=$$NET^%QZCHNET(%U7) Q:%U7=""  S %CUK=$$NET^%QZCHNET(%CUK) Q:%CUK=""  S %UP=$$NET^%QZCHNET(%UP) Q:%UP=""  S %UV=$$NET^%QZCHNET(%UV) Q:%UV=""  I %UN'=1 S %UN=$$NET^%QZCHNET(%UN) Q:%UN=""
 I WHOIS("ETUDE")'=0 D PA^%QXPGES2(WHOIS("ETUDE"),%U7,%CUK,%UP,%UV,%UN) Q
 I '($$KEYQRY^%SYSUTI1($L(%U7),$L(%CUK),$L(%UP),$L(%UV),$L(%UN))) D AFFER^%QSGESTJ Q
 I '($D(^[QUI]QUERYV(%U7,%CUK,%UP,%UN))) G PA00
 S %OOUV=^[QUI]QUERYV(%U7,%CUK,%UP,%UN) Q:%OOUV=%UV
 I ^TOZE(WHOIS,"QSVA") S TYPE="MODIFICATION" D PR^%QSVAREX(%U7,%CUK,%UP,%UV,%UN,TYPE,.MAJ,%OOUV) G:MAJ="FAUX" FINA
 K ^[QUI]QUERY2(%U7,%UP,%OOUV,%UN,%CUK),^[QUI]QUERY3(%U7,%CUK,%UN,%UP,%OOUV),^[QUI]QUERY4(%U7,%OOUV,%UP,%UN,%CUK)
 G PA01
PA00 I ^TOZE(WHOIS,"QSVA") S TYPE="AJOUT",%OOUV="" D PR^%QSVAREX(%U7,%CUK,%UP,%UV,%UN,TYPE,.MAJ,%OOUV) G:MAJ="FAUX" FINA
 S:'($D(^[QUI]QUERYV(%U7))) ^[QUI]QUERYV(%U7)=0 S:'($D(^[QUI]QUERYV(%U7,%CUK))) ^[QUI]QUERYV(%U7)=^[QUI]QUERYV(%U7)+1
PA01 S ^[QUI]QUERYV(%U7,%CUK,%UP,%UN)=%UV,^[QUI]QUERY2(%U7,%UP,%UV,%UN,%CUK)="",^[QUI]QUERY3(%U7,%CUK,%UN,%UP,%UV)="",^[QUI]QUERY4(%U7,%UV,%UP,%UN,%CUK)=""
 D:'($D(^[QUI]RQSDON("REMPRVAL",%U7,%UP))) SETREM^%QSPRVAL(%U7,%UP) I ^[QUI]RQSDON("REMPRVAL",%U7,%UP) D INSER^%QSPRVAL(%U7,%UP,%UV,0)
 
FINA D:^TOZE(WHOIS,"QSVA") EP^%QSVAREX(%U7,%CUK,%UP,%UN,TYPE,%OOUV)
 Q
PAJRN N JRN S JRN=$$GET^%SGVAR("JRN") I JRN'="" D:%UP="NOM" INDIV^xja(JRN,%U7,%CUK,1) D AFFEC^xja(JRN,%U7,%CUK,%UP,%UN,%UV)
 Q
 
 
PS(%U7,%CUK,%UP,%UV,%UN) ;supprime une valeur d'un attribut d'un individu.
 ;
 ;PS supprime la valeur d'un attribut d'un individu.
 ; test SUPPR : view "LINK":"RECURSIVE" zl "_QSGESTI" S QUI="DMO",WHOIS="DMO",WHOIS("ETUDE")=0,NUL=$$ZDIRECTORY^%GTM(QUI) d PS^%QSGESTI("BAC.A.SABLE","DEFAUT","DESCRIPTION","TEST",1)

SUPPR 
S Q:$A(%UV)=26
 I WHOIS("ETUDE")'=0 D PS^%QXPGES2(WHOIS("ETUDE"),%U7,%CUK,%UP,%UN) Q
 S:'($D(%UN)) %UN=1 Q:((((%U7="")!(%CUK=""))!(%UP=""))!(%UV=""))!(%UN="")
 Q:'($D(^[QUI]QUERYV(%U7,%CUK,%UP,%UN)))
 Q:^[QUI]QUERYV(%U7,%CUK,%UP,%UN)'=%UV
SUP2 I ^TOZE(WHOIS,"QSVA") D PR^%QSVAREX(%U7,%CUK,%UP,%UV,%UN,"SUPPRESSION",.MAJ,%UV) G:MAJ="FAUX" FINS
 K ^[QUI]QUERYV(%U7,%CUK,%UP,%UN),^[QUI]QUERY2(%U7,%UP,%UV,%UN,%CUK),^[QUI]QUERY3(%U7,%CUK,%UN,%UP,%UV),^[QUI]QUERY4(%U7,%UV,%UP,%UN,%CUK)
 D:'($D(^[QUI]RQSDON("REMATSPE",%U7,%UP))) SETREM^%QSGESPE(%U7,%UP) I ^[QUI]RQSDON("REMATSPE",%U7,%UP) D ATTSPE^%QSGESTJ(%U7,%CUK,%UP,%UN)
 S:'($D(^[QUI]QUERYV(%U7,%CUK))) ^[QUI]QUERYV(%U7)=^[QUI]QUERYV(%U7)-1
FINS D:^TOZE(WHOIS,"QSVA") EP^%QSVAREX(%U7,%CUK,%UP,%UN,"SUPPRESSION",%UV)
 
 Q
SUPJRN N JRN S JRN=$$GET^%SGVAR("JRN") I JRN'="" D:%UP="NOM" INDIV^xja(JRN,%U7,%CUK,0) D AFFEC^xja(JRN,%U7,%CUK,%UP,%UN,$C(1))
 Q
 
PKA(%U7,%UP) 
 N %CUK,%OOO,%UN,%UV,OO,OOO
 S %OOO="^[QUI]QUERY2(%U7,%UP)",%UV=""
 F O=0:0 S %UV=$O(@%OOO@(%UV)) Q:%UV=""  S %UN="" F OO=0:0 S %UN=$O(@%OOO@(%UV,%UN)) Q:%UN=""  S %CUK="" F OOO=0:0 S %CUK=$O(@%OOO@(%UV,%UN,%CUK)) Q:%CUK=""  D PS(%U7,%CUK,%UP,%UV,%UN)
 Q
PKAN(%U7,%UP,%UN) 
 N %CUK,%OOO,%UV,OO,OOO
 S %OOO="^[QUI]QUERY2(%U7,%UP)",%UV=""
 F O=0:0 S %UV=$O(@%OOO@(%UV)) Q:%UV=""  S %CUK="" F OOO=0:0 S %CUK=$O(@%OOO@(%UV,%UN,%CUK)) Q:%CUK=""  D PS(%U7,%CUK,%UP,%UV,%UN)
 Q
 
PSA(%U7,%CUK) 
 N %UP,%UPP,%UN,%UNN,%UV,%U7D
SA Q:(%U7="")!(%CUK="")
 S %UP="" F %UPP=0:0 S %UP=$O(^[QUI]QUERYV(%U7,%CUK,%UP)) Q:%UP=""  S %UN="" F %UNN=0:0 S %UN=$O(^[QUI]QUERYV(%U7,%CUK,%UP,%UN)) Q:%UN=""  S %UV=^[QUI]QUERYV(%U7,%CUK,%UP,%UN) D SAS
 Q
SAS I ('($D(^[QUI]RQSNOLOG(%UP))))!('($D(^[QUI]RQSLIEN(%U7,%UP)))) G SUP2
 I ($P(^[QUI]RQSLIEN(%U7,%UP),"^",1)=1)!($P(^[QUI]RQSLIEN(%U7,%UP),"^",1)=2) G SUP2
 S %U7D=$$REPD^%QSGEL2(%U7,%UP) Q:%U7D=""
 D SUPS^%QSGEST3(%U7,%CUK,%UP,%U7D,%UV) Q
 
PSV(%U7,%CUK,%UP) 
SV Q:((%U7="")!(%CUK=""))!(%UP="")
 I WHOIS("ETUDE")'=0 D PSV^%QXPGES2(WHOIS("ETUDE"),%U7,%CUK,%UP) Q
 N %UN,%UNN,%UV,%UVV
 S %UN="" F %UNN=0:0 S %UN=$O(^[QUI]QUERYV(%U7,%CUK,%UP,%UN)) Q:%UN=""  S %UV=^[QUI]QUERYV(%U7,%CUK,%UP,%UN) D SUP2
 Q
 
 
PSO(%U7,%CUK,%UP,%UN) 
 I WHOIS("ETUDE")'=0 D PS^%QXPGES2(WHOIS("ETUDE"),%U7,%CUK,%UP,%UN) Q
SO Q:(((%U7="")!(%CUK=""))!(%UP=""))!(%UN="")
 N %UV,%UVV
 Q:'($D(^[QUI]QUERYV(%U7,%CUK,%UP,%UN)))
 S %UV=^[QUI]QUERYV(%U7,%CUK,%UP,%UN) D SUP2
 Q
 
CARD N B,%B S B=""
 F %B=0:0 S B=$O(^[QUI]QUERYV(B)) Q:B=""  D VRCARD(B)
 Q
 
VRCARD(B) 
 N A,%A S A="" F %A=0:1 S A=$O(^[QUI]QUERYV(B,A)) Q:A=""
 S ^[QUI]QUERYV(B)=%A
 Q

