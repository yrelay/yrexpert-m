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

;%SGPKOU3^INT^1^59547,73891^0
%SGPKOU3 ;
 
 
t 
 N L,%L,VERS
 I WECR=1 U 0 S DX=10,DY=15 X XY W $J(" ",60) X XY W $E("traitement "_OB,1,60)
 D WRITE^%SYSUTI1(IOFI,"TRAITEMENT"),WRITE^%SYSUTI1(IOFI,OB)
 
 I $D(^[QUI]TTL(OB,1)) S L="" F %L=0:0 S L=$O(^[QUI]TTL(OB,1,L)) Q:L=""  D WRITE^%SYSUTI1(IOFI,^[QUI]TTL(OB,1,L))
 S VERS=$$GETVAL^%TLGEST(OB,"CARD",1) I VERS'="" D WRITE^%SYSUTI1(IOFI,"^^^"_VERS_"^"_$$GETVAL^%TLGEST(OB,"AUTEUR",1)_"^"_$$GETVAL^%TLGEST(OB,"DATE.DERNIERE.MODIFICATION",1))
 D WRITE^%SYSUTI1(IOFI,"")
 
 I $D(^[QUI]TTL(OB,2)) S L="" F %L=0:0 S L=$O(^[QUI]TTL(OB,2,L)) Q:L=""  D WRITE^%SYSUTI1(IOFI,^[QUI]TTL(OB,2,L))
 D WRITE^%SYSUTI1(IOFI,"")
 Q
m 
 N L,%L
 I WECR=1 U 0 S DX=10,DY=15 X XY W $J(" ",60) X XY W $E("modele "_OB,1,60)
 Q:'($D(^[QUI]EDMOD(OB)))
 D WRITE^%SYSUTI1(IOFI,"MODELE"),WRITE^%SYSUTI1(IOFI,OB)
 
 I $D(^[QUI]EDMOD(OB,"VAR")) S L="" F %L=0:0 S L=$O(^[QUI]EDMOD(OB,"VAR",L)) Q:L=""  D WRITE^%SYSUTI1(IOFI,^[QUI]EDMOD(OB,"VAR",L))
 D WRITE^%SYSUTI1(IOFI,"")
 
 I $D(^[QUI]EDMOD(OB,"LIGNE")) S L="" F %L=0:0 S L=$O(^[QUI]EDMOD(OB,"LIGNE",L)) Q:L=""  D WRITE^%SYSUTI1(IOFI,^[QUI]EDMOD(OB,"LIGNE",L))
 D WRITE^%SYSUTI1(IOFI,"")
 Q
f 
 N L,%L
 I WECR=1 U 0 S DX=10,DY=15 X XY W $J(" ",60) X XY W $E("format "_OB,1,60)
 Q:'($D(^[QUI]EDFORMAT(OB)))
 D WRITE^%SYSUTI1(IOFI,"FORMAT"),WRITE^%SYSUTI1(IOFI,OB)
 D WRITE^%SYSUTI1(IOFI,^[QUI]EDFORMAT(OB,"ORIENTATION"))
 
 I $D(^[QUI]EDFORMAT(OB,"LIGNES")) S L="" F %L=0:0 S L=$O(^[QUI]EDFORMAT(OB,"LIGNES",L)) Q:L=""  D WRITE^%SYSUTI1(IOFI,^[QUI]EDFORMAT(OB,"LIGNES",L))
 D WRITE^%SYSUTI1(IOFI,"")
 Q
 
r 
 N L,%L
 I WECR=1 U 0 S DX=10,DY=15 X XY W $J(" ",60) X XY W $E("requete "_OB,1,60)
 D WRITE^%SYSUTI1(IOFI,"REQUETE")
 D WRITE^%SYSUTI1(IOFI,OB)
 D WRITE^%SYSUTI1(IOFI,^[QUI]RQS1(OB,"BASE"))
 D WRITE^%SYSUTI1(IOFI,^[QUI]RQS1(OB,"COMM"))
 
 D WRITE^%SYSUTI1(IOFI,"")
 I $D(^[QUI]RQS1(OB,"VARIABLES")) S L="" F %L=0:0 S L=$O(^[QUI]RQS1(OB,"VARIABLES",L)) Q:L=""  D WRITE^%SYSUTI1(IOFI,^[QUI]RQS1(OB,"VARIABLES",L))
 D WRITE^%SYSUTI1(IOFI,"")
 I $D(^[QUI]RQS1(OB,"CONTRAINTES")) S L="" F %L=0:0 S L=$O(^[QUI]RQS1(OB,"CONTRAINTES",L)) Q:L=""  D WRITE^%SYSUTI1(IOFI,^[QUI]RQS1(OB,"CONTRAINTES",L))
 D WRITE^%SYSUTI1(IOFI,"")
 Q
psv 
 N L,%L
 I WECR=1 U 0 S DX=10,DY=15 X XY W $J(" ",60) X XY W $E("passerelle "_OB,1,60)
 D WRITE^%SYSUTI1(IOFI,"PASSERELLE SUITE DE VALEURS")
 D WRITE^%SYSUTI1(IOFI,OB)
 D WRITE^%SYSUTI1(IOFI,^[QUI]LKY2(OB))
 D WRITE^%SYSUTI1(IOFI,$S($D(^[QUI]LKYPROT(OB)):^[QUI]LKYPROT(OB),1:""))
 I $D(^[QUI]LKYENR2(OB)) S L="" F %L=0:0 S L=$O(^[QUI]LKYENR2(OB,L)) Q:L=""  D WRITE^%SYSUTI1(IOFI,L),WRITE^%SYSUTI1(IOFI,^[QUI]LKYENR2(OB,L))
 D WRITE^%SYSUTI1(IOFI,"")
 S L="" F %L=0:0 S L=$O(^[QUI]LKYATR2(OB,L)) Q:L=""  S L2="" F %L2=0:0 S L2=$O(^[QUI]LKYATR2(OB,L,L2)) Q:L2=""  S L3="" F %L3=0:0 S L3=$O(^[QUI]LKYATR2(OB,L,L2,L3)) Q:L3=""  D WRITE^%SYSUTI1(IOFI,L),WRITE^%SYSUTI1(IOFI,L2),WRITE^%SYSUTI1(IOFI,L3),WRITE^%SYSUTI1(IOFI,^[QUI]LKYATR2(OB,L,L2,L3))
 D WRITE^%SYSUTI1(IOFI,"")
 Q
msq 
 N L,%L,M,%M
 I WECR=1 U 0 S DX=10,DY=15 X XY W $J(" ",60) X XY W $E("Masque de saisie "_OB,1,60)
 Q:'($D(^[QUI]RQSGLO("SR","DEF",OB)))
 D WRITE^%SYSUTI1(IOFI,"MASQUE DE SAISIE"),WRITE^%SYSUTI1(IOFI,OB)
 D WRITE^%SYSUTI1(IOFI,"DEFINITION")
 D WRITE^%SYSUTI1(IOFI,^[QUI]RQSGLO("SR","DEF",OB))
 
 I '($D(^[QUI]RQSGLO("SR","DEF",OB,"CHAMPS"))) G fmsq
 S L="" F %L=0:0 S L=$O(^[QUI]RQSGLO("SR","DEF",OB,"CHAMPS",L)) Q:L=""  D WRITE^%SYSUTI1(IOFI,"CHAMP "_L),champ
 
fmsq I $D(^[QUI]RQSGLO("SR","DEF",OB,"UCONTS")) D WRITE^%SYSUTI1(IOFI,"EXECUTION"),WRITE^%SYSUTI1(IOFI,^[QUI]RQSGLO("SR","DEF",OB,"UCONTS"))
 D WRITE^%SYSUTI1(IOFI,"")
 Q
 
champ D WRITE^%SYSUTI1(IOFI,^[QUI]RQSGLO("SR","DEF",OB,"CHAMPS",L))
 I $D(^[QUI]RQSGLO("SR","DEF",OB,"CHAMPS",L,"AIDE")) D WRITE^%SYSUTI1(IOFI,"AIDE "_L),WRITE^%SYSUTI1(IOFI,^[QUI]RQSGLO("SR","DEF",OB,"CHAMPS",L,"AIDE")) I $D(^[QUI]RQSGLO("SR","DEF",OB,"CHAMPS",L,"CONTROLES")) D WRITE^%SYSUTI1(IOFI,"CONTROLES "_L),WRITE^%SYSUTI1(IOFI,^[QUI]RQSGLO("SR","DEF",OB,"CHAMPS",L,"CONTROLES"))
 I '($D(^[QUI]RQSGLO("SR","DEF",OB,"CHAMPS",L,"VALEG"))) Q
 S M="" F %M=0:0 S M=$O(^[QUI]RQSGLO("SR","DEF",OB,"CHAMPS",L,"VALEG",M)) Q:M=""  D WRITE^%SYSUTI1(IOFI,"VALEURS.LEGALES "_L),WRITE^%SYSUTI1(IOFI,^[QUI]RQSGLO("SR","DEF",OB,"CHAMPS",L,"VALEG",M))
 Q
prd 
 N L,%L
 I WECR=1 U 0 S DX=10,DY=15 X XY W $J(" ",60) X XY W $E("predicat "_OB,1,60)
 D WRITE^%SYSUTI1(IOFI,"PREDICAT"),WRITE^%SYSUTI1(IOFI,OB)
 
 S %L=0
prdarc S %L=%L+1
 G:'($D(^[QUI]RQSGLO("PRED",OB,%L))) prdfin
 D WRITE^%SYSUTI1(IOFI,^[QUI]RQSGLO("PRED",OB,%L))
 I $D(^[QUI]RQSGLO("PRED",OB,%L,"COEF")) D WRITE^%SYSUTI1(IOFI,^[QUI]RQSGLO("PRED",OB,%L,"COEF")) G prdarc
 D WRITE^%SYSUTI1(IOFI,"")
 G prdarc
 
prdfin D WRITE^%SYSUTI1(IOFI,"")
 Q
 ;

