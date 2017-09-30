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

;TO3GBLIM^INT^1^59547,74870^0
TO3GBLIM ;
 
 S %LIEU=$$^%QZCHW("Bloc implicite") D ^TO3WLIEU I $D(^PHASADM($I,NUFA,TWREF,"BLOC",RBL)) S %GAM=1,^BLOCI($I,NUFA,TWREF,RBL)=^PHASADM($I,NUFA,TWREF,"BLOC",RBL),^SAVE($I,"OK")=1 G FINI
 D EXBIM G:%ABEND=1 FIN K ^SAVE($I) F IT="USER","QUI","RBL","YASSET","GYA","WHO",$$^%QZCHW("BATCH"),"NUFA","TWREF","YA" S ^SAVE($I,IT)=@IT
 D ^%QCAMEMS K  F IT="USER","QUI","RBL","YASSET","GYA","WHO",$$^%QZCHW("BATCH"),"NUFA","TWREF","YA" S @IT=^SAVE($I,IT)
 K DON S U1=-1 F U2=1:1 S U1=$N(^DON($I,U1)) Q:U1=-1  S DON(U1)=^DON($I,U1)
 S (YA,YB)=YASSET,BNUFA=NUFA,BQUI=QUI,BTWREF=TWREF,BRBL=RBL,QUI=USER,WHOIS=WHO D CURRENT^%IS,ZD^%QMDATE4 S REFID=$P(GYA,":",2) D ^TORECBLO
 I %GAM=1 S ^BLOCI($I,BNUFA,BTWREF,BRBL)=INUFA_"^"_NUREF_"^"_QUI,^SAVE($I,"OK")=1 G FIN
 K U1,U2 D ^TOTPOP S QTE=$P(@("^[BQUI]TREEWORK(BNUFA,"_BTWREF_")"),"^",3),ET=^PILETUD($I),^PILETUD($I)=ET+1,^PILETUD($I,ET)=NUFA_"^0^0^^^"_QUI_"^"_GYA_"^"_QTE_"^"_ARTET_"^"_YASSET_"^0^0",^SAVE($I,"OK")=0
 S ^PHASADM($I,BNUFA,BTWREF,"BLOC",BRBL)=NUFA_"^0^"_QUI
FIN D ^%QCAMEMR,^TO3SAVTR,^TO3ARTHE,^TO3RESTR
FINI S %LIEU=$$^%QZCHW("Fin bloc imp.") D ^TO3WLIEU Q
DEB21 S TWREF=0,^V($I,YA,$$^%QZCHW("QUANTITE"))=QTTE,^[QUI]UNITE(YA,$$^%QZCHW("QUANTITE"))="",^[QUI]TREEWORK(NUFA,0)=YA_"^"_YB_"^"_QTTE,^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE"))=QTTE G FIN
START I '(DTM) K (GNUFA,%ABEND,%ZD,MCM,COUNT,FF,MA,PIM,PIMEN,QUI,WHOIS,SUB,%PROGEX) G START1
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="GNUFA","%ABEND","%ZD","MCM","COUNT","FF","MA","PIM","PIMEN","QUI","WHOIS","SUB","%PROGEX","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
START1 D VARSYS^%QCSAP G FIN
FIND S GOG=OG,GNUFA=NUFA,GTWREF=TWREF D PHAS^TO3GIVBP G FIN
EXBIM K DON S TACP="^[QUI]BLOCIMPL"_RBL,YASSET=$P(@TACP@(0),"|",2),USER=$P(@TACP@(0),"|",3),GYA=YASSET_":",WHO=$P(@TACP@(0),"|",4) S:WHO="" WHO=WHOIS
 K ^DON($I) S NUEX=0 F WWE=0:0 S NUEX=$N(@TACP@(NUEX)) Q:NUEX=-1  Q:(NUEX+0)=0  D AFF G:%ABEND=1 END
END K TACP,WWE,NUEX,DON Q
AFF S $ZT=^TOZE($I,"A")
RETERR Q:%ABEND=1  S AFFECT=@TACP@(NUEX) S:AFFECT="" ^DON($I,NUEX)="" S:AFFECT'="" @("^DON($I,NUEX)="_AFFECT) S GYA=GYA_^DON($I,NUEX)_"/" Q

