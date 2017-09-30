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

;%LXJIMP^INT^1^59547,73870^0
%LXJIMP ;
 
 
 
 
DEBUT 
 N MOTMODE,QUANTITE,SORTIE,MOT1,MOT2,IMPR,IMP,LLIGNE,NBLIGNE,TYPEIMPR,IMOT,NBMOTS,MNVUE,CONTR,GLOB,MOT
 D CLEPAG^%VVIDEO
 
 W $$CTR^%VPRINT($$^%QZCHW("CONSULTATION DU"),80),!
 D IMPRC^%VZCAT($$^%QZCHW("LEXIQUE"),80)
 D IMPRC^%VZCAT(WHOIS,80)
REPMODE 
 D POCLEPA^%VVIDEO
 S MOTMODE=$$^%VZECH2($$^%QZCHW("consultation"),$$^%QZCHW("mots seuls"),$$^%QZCHW("detaillee"))
 
 G:MOTMODE=1 FIN
 I (MOTMODE'=$$^%QZCHW("mots seuls"))&(MOTMODE'=$$^%QZCHW("detaillee")) G REPMODE
 S MNVUE=$$^%QZCHW("Vue")_" : "
 S MNVUE(1)=$$^%QZCHW("totale")_"^totale"
 S MNVUE(2)=$$^%QZCHW("partielle")_"^partielle"
 S MNVUE(3)=$$^%QZCHW("mots reserves")_"^mots reserves"
REPQUA 
 D POCLEPA^%VVIDEO
 D ^%VQUIKMN(1,80,23,"MNVUE",.QUANTITE,.CONTR)
 G:(CONTR="A")!(CONTR="F") REPMODE
 I ((QUANTITE'="totale")&(QUANTITE'="partielle"))&(QUANTITE'="mots reserves") G REPQUA
 
SOR 
 S MOT1="0",MOT2="z"
 I QUANTITE="partielle" D LECMOTS
 
 D POCLEPA^%VVIDEO
 S SORTIE=$$^%VZESOR("E") I SORTIE=-1 G REPQUA
 S SORTIE=$S(SORTIE=1:"IMPR",1:"ECRAN")
 
 S DY=21,DX=0 D CLEBAS^%VVIDEO
 W $$^%QZCHW($S(SORTIE="IMPR":"impression",1:"affichage"))," ",$$^%QZCHW("des")," ",$$^%QZCHW($S(MOTMODE="detaillee":"mots,synonymes,unite et commentaires",1:MOTMODE)),",",$$^%QZCHW("vue")," ",$$^%QZCHW(QUANTITE)
 W:QUANTITE=$$^%QZCHW("partielle") " "
 W !,$$^%QZCHW("premier mot")_" : "_MOT1_"  "_$$^%QZCHW("dernier mot")_" : "_MOT2
 S IMPR=$S(SORTIE="ECRAN":$I,SORTIE="IMPR":$$TABID^%INCOIN("PRINTER"))
 D PARAMS^%QCSAP(IMPR,.IMP)
 G FIN:'(IMP)
 S GLOB=$S(QUANTITE="mots reserves":"^[QUI]ZSYSMORE",1:"^[QUI]TOLEX")
 S LLIGNE=IMP("RM")
 
 I IMPR'=$I S NBLIGNE=$$TABID^%INCOIN("IMPRCOUR")-7
 I IMPR=$I S NBLIGNE=23
 
 S NBMOTS=0,MOT=""
 F IMOT=0:0 S MOT=$O(^[QUI]ZSYSMORE(MOT)) Q:(MOT="")!(MOT="z")  S NBMOTS=NBMOTS+1
 S ^[QUI]ZSYSMORE=NBMOTS
 S NBMOTS=0,MOT=""
 F IMOT=0:0 S MOT=$O(^[QUI]TOLEX(MOT)) Q:(MOT="")!(MOT="z")  S NBMOTS=NBMOTS+1
 S ^[QUI]TOLEX=NBMOTS
 I QUANTITE="totale" S NBMOTS=^[QUI]TOLEX-^[QUI]ZSYSMORE G IMP
 I QUANTITE="mots reserves" S NBMOTS=^[QUI]ZSYSMORE G IMP
 S MOTLEX=MOT1
 S NBMOTS=0
 F IMOT=0:0 S MOTLEX=$O(@GLOB@(MOTLEX)) Q:((MOTLEX="")!(MOTLEX="z"))!(MOTLEX]MOT2)  I '($D(^[QUI]ZSYSMORE(MOTLEX))) S NBMOTS=NBMOTS+1
 
IMP 
 I SORTIE="ECRAN" D ECMOT2^%LXJIM2(GLOB)
 I SORTIE="IMPR" D IMPRI
FIN Q
 
LECMOTS 
 N CTR
 D POCLEPA^%VVIDEO
 D S1^%VLECFL(MOT1,$$^%QZCHW("premier mot")_" : ",0,23,.CTR,.MOT1)
 D POCLEPA^%VVIDEO
 D S1^%VLECFL(MOT2,$$^%QZCHW("dernier mot")_" : ",0,23,.CTR,.MOT2)
 
 I MOT1]MOT2 D ^%VZEAVT($$^%QZCHW("attention")_" "_$$^%QZCHW("dernier mot")_" "_MOT2_" "_$$^%QZCHW("est avant le premier mot")_" "_MOT1) G LECMOTS
 Q
 
ECRI 
 D ECMOT2^%LXJIM2(GLOB)
 Q
 
IMPRI 
 
 S TYPEIMPR=IMP("SUB")
 
 W !,$$^%QZCHW("impression de l'entete en cours")
 O IMPR
 
 D BOLD^%VPRZPR(TYPEIMPR,IMPR),DOUBLE^%VPRZPR(TYPEIMPR,IMPR)
 D IMTETE
 
 D DOUBLE2^%VPRZPR(TYPEIMPR,IMPR),BOLD2^%VPRZPR(TYPEIMPR,IMPR)
 D ECMOT2^%LXJIM2(GLOB)
 
 C IMPR
 D POCLEPA^%VVIDEO W $$^%QZCHW("impression terminee")
 Q
 
IMTETE 
 N MM,%MM
 S MM="" F %MM=0:1 S MM=$O(^[QUI]TOLEX(MM)) Q:MM=""
 S ^[QUI]TOLEX=%MM
 W !,!,!,!,!,!,!,!,!,!
 D IMPRC^%VZCAT("LEXIQUE",LLIGNE) W !,!
 D IMPRC^%VZCAT(WHOIS_" ",LLIGNE)
 W !,!,!,!,!,!,$$CTR^%VPRINT($$^%QZCHW("Ce lexique contient")_" "_^[QUI]TOLEX_" "_$$^%QZCHW("mots")_" "_$$^%QZCHW("au total"),LLIGNE)
 W !,!,!,!,$$CTR^%VPRINT($$^%QZCHW("Impression de")_" "_NBMOTS_" "_$$^%QZCHW("mots"),LLIGNE)
 W !,!,!,!,$$CTR^%VPRINT("date "_$$DATE^%QMDATE,LLIGNE)
 W !,!,!,!,$$CTR^%VPRINT($$^%QZCHW("Copyright Yrelay"),LLIGNE)
 
 Q

