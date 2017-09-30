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

;%LXMUIM^INT^1^59762,66841^0
%LXMUIMP ;
 
 
 
 
 
 
 
 
 
 
DEBUT 
 N MOTMODE,QUANTITE,SORTIE,MOT1,MOT2,CONTROLE,IMPR,IMP,LLIGNE,NBLIGNE,TYPEIMPR,IMOT,NBMOTS,MNVUE,CONTR,GLOB,GLOAPPLI,TEMP,GLOCHOIX,GLOMOT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S GLOAPPLI=$$CONCAS^%QZCHAD(TEMP,"APPLICATIONS")
 S GLOCHOIX=$$CONCAS^%QZCHAD(TEMP,"CHOIX.APPLI")
 S GLOMOT=$$CONCAS^%QZCHAD(TEMP,"MOTS.CHOISIS")
 K @(TEMP)
 D CLEPAG^%VVIDEO
 D ^%VZCD(0,39,0,4,1,0,$$^%QZCHW("Mots reserves utilisateurs"))
 D ^%VZEATT
 S APPLI=""
BAPPLI S APPLI=$O(^MOTREUAI(APPLI))
 G:APPLI="" CHAPPLI
 G:'($$OKR^%INCOIN(APPLI)) BAPPLI
 S @GLOAPPLI@(APPLI)=""
 G BAPPLI
 
 
CHAPPLI 
 D INIT^%QUCHOIP(GLOAPPLI,1,"",0,5,80,17)
 D CLEPAG^%VVIDEO
 D ^%VZCD(0,39,0,4,1,0,$$^%QZCHW("Mots reserves utilisateurs"))
 D AFF^%QUCHOIP
 D ^%QUCHOYP(GLOCHOIX)
 G:'($D(@GLOCHOIX)) FIN
 D ^%VZEATT
 S APPLI=""
BCHMOT S APPLI=$O(@GLOCHOIX@(APPLI))
 G:APPLI="" REPMODE
 S MOT=""
BCHM S MOT=$O(^MOTREUAI(APPLI,MOT))
 G:MOT="" BCHMOT
 S @GLOMOT@(MOT)=""
 G BCHM
 
REPMODE 
 D POCLEPA^%VVIDEO
 S MOTMODE=$$^%VZECH2("Consultation : ","mots seuls","detaillee")
 G:MOTMODE=1 FIN
 I (MOTMODE'="mots seuls")&(MOTMODE'="detaillee") G REPMODE
REPQUA 
 D POCLEPA^%VVIDEO
 S QUANTITE=$$^%VZECH2("Vue : ","totale","partielle")
 G:QUANTITE=1 REPMODE
 G:(QUANTITE'="totale")&(QUANTITE'="partielle") REPQUA
 
 S MOT1="0",MOT2="z"
 I QUANTITE="partielle" D LECMOTS
 
 D POCLEPA^%VVIDEO
 S SORTIE=$$^%VZESOR("E") G:SORTIE=-1 REPQUA
 S SORTIE=$S(SORTIE=1:"IMPR",1:"ECRAN")
 
 D POCLEPA^%VVIDEO
 S DY=21,DX=0 X XY
 W $$^%QZCHW($S(SORTIE="IMPR":"impression",1:"affichage"))," ",$$^%QZCHW("des")," ",$$^%QZCHW($S(MOTMODE="detaillee":"mots,synonymes,unite et commentaires",1:MOTMODE)),",",$$^%QZCHW("vue")," ",$$^%QZCHW(QUANTITE)
 W:QUANTITE=$$^%QZCHW("partielle") " "
 W !,$$^%QZCHW("premier mot")_" : "_MOT1_"  "_$$^%QZCHW("dernier mot")_" : "_MOT2
 S IMPR=$S(SORTIE="ECRAN":$I,SORTIE="IMPR":$$TABID^%INCOIN("PRINTER"))
 D PARAMS^%QCSAP(IMPR,.IMP)
 G FIN:'(IMP)
 S LLIGNE=IMP("RM"),NBLIGNE=IMP("SL")-7
 
 S MOTLEX=MOT1
 S NBMOTS=$S($D(@GLOMOT@(MOTLEX)):1,1:0)
 F IMOT=NBMOTS:1 S MOTLEX=$O(@GLOMOT@(MOTLEX)) Q:((MOTLEX="")!(MOTLEX="z"))!(MOTLEX]MOT2)
 S NBMOTS=IMOT
 D ECRI:SORTIE="ECRAN",IMPRI:SORTIE="IMPR"
 
FIN D END^%QUCHOIP
 K @(TEMP)
 Q
 
 
LECMOTS 
 D POCLEPA^%VVIDEO
 D S1^%VLECFL(MOT1,$$^%QZCHW("premier mot")_" : ",0,23,.CONTROLE,.MOT1)
 D POCLEPA^%VVIDEO
 D S1^%VLECFL(MOT2,$$^%QZCHW("dernier mot")_" : ",0,23,.CONTROLE,.MOT2)
 
 I MOT1]MOT2 D ^%VZEAVT($$^%QZCHW("attention")_$$^%QZCHW(" dernier mot ")_MOT2_$$^%QZCHW(" est avant le premier mot ")_MOT1) G LECMOTS
 Q
ECRI 
 D ECMOT2^%LXJIM2(GLOMOT)
 Q
IMPRI 
 
 S TYPEIMPR=IMP("SUB")
 
 W !,$$^%QZCHW("Impression de l'entete en cours")
 O IMPR
 
 D BOLD^%VPRZPR(TYPEIMPR,IMPR),DOUBLE^%VPRZPR(TYPEIMPR,IMPR)
 D IMTETE
 
 D DOUBLE2^%VPRZPR(TYPEIMPR,IMPR),BOLD2^%VPRZPR(TYPEIMPR,IMPR)
 D ECMOT2^%LXJIM2(GLOMOT)
 
 C IMPR
 D POCLEPA^%VVIDEO W $$^%QZCHW("impression terminee")
 Q
IMTETE 
 N MM,%MM
 S MM="" F %MM=0:1 S MM=$O(^[QUI]TOLEX(MM)) Q:MM=""
 S ^[QUI]TOLEX=%MM
 W !,!,!,!,!,!,!,!,!,!
 D IMPRC^%VZCAT("MOTS RESERVES",LLIGNE) W !,!
 D IMPRC^%VZCAT(WHOIS_" ",LLIGNE)
 W !,!,!,!,!,!,$$CTR^%VPRINT($$^%QZCHW("Le lexique contient")_" "_^[QUI]TOLEX_" "_$$^%QZCHW("mots")_" "_$$^%QZCHW("au total"),LLIGNE)
 W !,!,!,!,$$CTR^%VPRINT($$^%QZCHW("Impression de")_" "_NBMOTS_" "_$$^%QZCHW("mots"),LLIGNE)
 W !,!,!,!,$$CTR^%VPRINT("date "_$$DATE^%QMDATE,LLIGNE)
 W !,!,!,!,$$CTR^%VPRINT($$^%QZCHW("Copyright Yrelay"),LLIGNE)
 Q

