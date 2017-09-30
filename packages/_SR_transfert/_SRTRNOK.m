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
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%SRTRNOK^INT^1^59547,73891^0
SRTRNOK ;
 
 
 
 
 
 
VISU 
 N %R,%C,AFFI,CLE,GLO,GLS,I,NUM,PK,TIT,X,Y,CTR
 D ^%VZCDB($$^%QZCHW("Donnees incorrectes"),0)
 S GLS=$$ADR^%SRACTIV(SA)
 S GLS=$E(GLS,1,$L(GLS)-1)
 S GLO=$$CONCAT^%QZCHAD(GLNOK,GR_",""E""")
 S AFFI=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"AFF")
 I '($D(@GLERR)) D CONS
CH S DX=0,DY=2 D CLEBAS^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Donnees incorrectes"),0)
CH1 S %R=22,Y="10\CH\3\\\toutes.les.erreurs,erreurs.enregistrements,modification"
 D ^%PKPOP
 K @(AFFI)
 Q:(CTR="A")!(CTR="F")
 G:CTR'="" CH1
 I X=3 G MODIF
 I X=2 G CHOIX
 
 
 D ^%VZEATT
 S CLE="",I=0,TIT="Toutes les donnees incorrectes"
BCL S CLE=$O(@GLERR@(CLE))
 I CLE="" D AFF G CH
 D INSE(@GLERR@(CLE))
 D ERR(@GLERR@(CLE))
 D INSE(" ")
 G BCL
 
CHOIX 
 S CLE=$$UN^%PKCHOIX(GLERR,1,3,17)
 I CLE="" G CH
 S I=0,TIT="Erreur sur un enregistrement"
 D ERR(@GLERR@(CLE))
 D AFF
 G CHOIX
 
MODIF 
 S CLE=$$UN^%PKCHOIX(GLERR,1,3,17)
 I CLE="" G CH
 S I=GLS_","_@GLERR@(CLE)_")"
 I '($D(@I)) D ^%VZEAVT($$^%QZCHW("Cet enregistrement n'existe plus")) G MODIF
 D MODIF^%SRACTIV(SA,@I,GLS_")",1)
 G MODIF
 
AFF 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW(TIT),0)
 S I=$$UN^%PKCHOIX(AFFI,1,3,17)
 Q
 
FIN K @(AFFI)
 Q
 
CONS 
 N CLE
 S CLE=""
CO2 S CLE=$O(@GLNOK@(GR,"E",CLE)) Q:CLE=""
 S @GLERR@($E(CLE,1,75))=CLE
 G CO2
 
ERR(CLE) 
 S NUM=""
BCN S NUM=$O(@GLO@(CLE,NUM))
 I NUM="" Q
 D INSE("  "_@GLO@(CLE,NUM))
 G BCN
 
INSE(M) 
 S I=I+1,M=$E(M,1,72)
 S @AFFI@($J(I,3)_". "_M)=""
 Q
 
 
 
IMPVAL 
 N CH,GL,GLC,GLS,I,IMPR,LARG,LC,LIB,LIGN,NC,VAL
 I '($D(@GLERR)) D CONS
 D ATT^%PKUTIL(20,22,$$^%QZCHW("impression en cours"),"HR")
 S GL=$$ADR^%SRCOMP(SA)
 S GLS=$$ADR^%SRACTIV(SA)
 S GLS=$E(GLS,1,$L(GLS)-1)
 S IMPR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IMPR") K @(IMPR)
 S @IMPR@("TITRE",1)=" "
 S @IMPR@("TITRE",2)=$$^%QZCHW("Liste des valeurs non transferees")
 
 S LC=3,(LIGN,CH)=""
 F I=0:0 S CH=$O(@GL@("CHAMPS",CH)) Q:CH=""  D TIT
 S LC=1,(LIGN,CH)=""
 
 S NC=@GL@("NBC")
 
 F I=0:0 S CH=$O(@GLERR@(CH)) Q:CH=""  S GLC=GLS_","_@GLERR@(CH)_")",VAL=@GLC D LIGN
 D IMPT^%VPRINT($$CONCAS^%QZCHAD(IMPR,"LIGNE"),$$CONCAS^%QZCHAD(IMPR,"TITRE"))
 D MESS^%PKUTIL(20,22,$$^%QZCHW("impression terminee"),1)
 K @(IMPR)
 Q
 
TIT 
 
 S LIB=@GL@("CHAMPS",CH)
 
 I $D(@GL@("CLE",CH)) S LIB=LIB_" ("_@GL@("CLE",CH)_")"
 
 S LARG(CH)=@GL@("LARG",CH)
 D INS(CH,"TITRE")
 Q
 
INS(CH,IND) 
 S LIB=$E(LIB,1,LARG(CH)),LIB=LIB_$J("",LARG(CH)-$L(LIB))
 
 I ($L(LIGN)+$L(LIB))>80 S @IMPR@(IND,LC)=LIGN,LC=LC+1,LIGN=""
 S LIGN=LIGN_LIB_" "
 Q
 
LIGN 
 S @IMPR@("LIGNE",LC)=" ",LC=LC+1
 F I=1:1:NC S LIB=$P(VAL,$C(0),I) D INS(I,"LIGNE")
 Q:LIGN=""
 S @IMPR@("LIGNE",LC)=LIGN,LC=LC+1,LIGN=""
 Q

