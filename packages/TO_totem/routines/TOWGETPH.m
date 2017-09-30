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

;TOWGETPH^INT^1^59547,74876^0
TOWGETPH ;
 
 S RPH="LAF" F IT=%ALL,%ETAT,%LARG,DP S RPH=RPH_"/"_$S(IT[$$^%QZCHW("TOUS"):"",1:IT)
 S RPHCP=RPH_"^"_0,NG=-1,ART="LAF" K NG
 I $D(^[QUI]GAMLAF(RPH)) S NG=^[QUI]GAMLAF(RPH) D KILL
 I (C=CBLANC)!('($D(^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP)))) K:$D(NG) ^[QUI]TVPAR(NG) G END
 G:$D(NG) GETPH D ^TO6POP S ^[QUI]GAMLAF(RPH)=NUFA G GETPH
KILL S ORLAF=-1 F IT=1:1 S ORLAF=$N(^[QUI]AUTOPLAF(NG,0,ORLAF)) Q:ORLAF=-1  S PARA=$P(^[QUI]AUTOPLAF(NG,0,ORLAF),"^",1) I PARA'="" K ^[QUI]TVPAR(NG,0,PARA)
 F IT="AUTOPLAF","SECT","DIM","CONS","PHAS","DUREE","COUT","RAISON" S TAB="^[QUI]"_IT_"(NG)" K @(TAB)
 K ^[QUI]ANTETUDE(ART,NG) S NUFA=NG,POSTREE=0,REFID=RPH,(ARTCT,ARTET)=ART D DEL^TO3RETUD Q
GETPH D ZD^%QMDATE4,^%QMDAK0 S ^[QUI]ANTETUDE(ART,NUFA,0)=RPHCP_"^0^"_%DAT_"^"_HEURE,REFID=RPH,POSTREE=0,(ARTCT,ARTET)=ART D AFF^TO3RETUD S NUOP=100,ORLAF=1,OPH="",POS=69E-1,VU=0,DB=0,PASS=0
 F UU=1:1 S CC=$E(C,UU) Q:CC=""  Q:(CC=" ")&(VU=1)  S:CC'=" " DB=1 D:DB=1 TRAIT S POS=POS-1E-1
 D CONCLU S ORD=$P($P($T(ORD),";;",2),";",PASS),PARA=$$^%QZCHW("EPAISSEUR.")_ORD_$$^%QZCHW(".PASSE.")_$S(OPH="-":"L7",1:"L6"),VPA=POS D PARA
END K RPH,ORLAF,EBAC,IT,RPHCP,ART,NG,POSTREE,REFID,ARTCT,ARTET,NUOP,OPH,POS,VU,UU,CC,CCS,DEBL,MAC,LAFNOP,NOPLAF,CONS,XEC,YEC,WW,SYMB Q
FIN Q
TRAIT S CCS=CC G:CC=" " FIN S:(PASS=0)&(CC'="*") PASS=1 G:CC=OPH FIN
 I VU=0 S PARA=$$^%QZCHW("EPAISSEUR.EBAUCHAGE.A.CHAUD"),(EBAC,VPA)=POS D PARA
 I CC="*" S CCS=$E(C,UU+1),CC=OPH D OPER,L6 S PASS=PASS+1
 S VU=1 G FIN
L6 D:OPH'="" CONCLU S DEBL=$S($E(C,UU-1)="*":POS+1E-1,1:POS),OOPH=OPH,OPH=$S($E(C,UU)="*":$S((CCS=" ")!(CCS=""):OPH,1:CCS),1:CC),PASS=$S(OPH=OOPH:PASS,1:0),MAC=$S(CCS="-":"L7",1:"L6"),LAFNOP=$$^%QZCHW("LAMINAGE.FROID/")_NUOP,NOPLAF=LAFNOP D GET S NUOP=NUOP+100 G FIN
GET S ^[QUI]PHAS(NUFA,0,NUOP)=NOPLAF,^[QUI]RAISON(NUFA,0,NUOP)="PHASEMODIFICATION",^[QUI]SECT(NUFA,0,NOPLAF)=MAC G FIN
CONCLU S $ZT="FIN",CONS=$$^%QZCHW("De ")_DEBL_$$^%QZCHW(" a ")_$S($E(C,UU-1)="*":POS+1E-1,1:POS),^[QUI]DIM(NUFA,0,LAFNOP,1)=CONS G FIN
OPER S XEC=79-(POS*10),YEC=-1 I (PASS'=0)!(OPH'="") S ORD=$P($P($T(ORD),";;",2),";",PASS),PARA=$$^%QZCHW("EPAISSEUR.")_ORD_$$^%QZCHW(".PASSE.")_$S(OPH="-":"L7",1:"L6"),VPA=POS D PARA
 F WW=0:0 S YEC=$N(^GRPH($I,XEC,YEC)) Q:YEC=-1  S SYMB=^GRPH($I,XEC,YEC) D TRSYM S NUOP=NUOP+100
 
 G FIN
TRSYM 
 I PASS=0 S PARA=$$^%QZCHW("EPAISEUR.RECUIT.INTERMEDIAIRE.SUR.BLC"),VPA=$S(SYMB="@":EBAC,1:"") D:VPA'="" PARA G TRS
 S MC=$S(OPH="-":"L7",1:"L6"),SOP=$S(SYMB="@":$$^%QZCHW("RECUIT"),1:$$^%QZCHW("RIVEE")),ORD=$P($P($T(ORD),";;",2),";",PASS),PARA=$$^%QZCHW("EPAISSEUR.")_SOP_$$^%QZCHW(".APRES.")_ORD_$$^%QZCHW(".PASSE.")_MC,VPA=POS D PARA
TRS S NOPLAF=$S(SYMB="@":$$^%QZCHW("RECUIT"),1:$$^%QZCHW("RIVAGE"))_"/"_NUOP,MAC=$S(SYMB="^":$S(OPH="-":"R18",1:"R26"),1:"F56"),CONS=$$^%QZCHW("a ")_POS,^[QUI]DIM(NUFA,0,NOPLAF,1)=CONS D GET G FIN
PARA S ^[QUI]AUTOPLAF(NUFA,0,ORLAF)=PARA_"^"_VPA,ORLAF=ORLAF+1,^[QUI]TVPAR(NUFA,0,PARA)=VPA,^[QUI]RAISON(NUFA,0,PARA)="IMPLICITE MODIFICATION" G FIN
ORD ;;PREMIERE;DEUXIEME;TROISIEME;QUATRIEME;CINQUIEME;SIXIEME;SEPTIEME;HUITIEME;NEUVIEME;DIXIEME;ONZIEME;DOUZIEME;TREIZIEME;QUATORZIEME;QUINZIEME

