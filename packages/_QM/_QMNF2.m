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

;%QMNF2^INT^1^59547,73879^0
QMNF2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
REP(OK) G AFF1
 
LIEN(OK) G AFF2
 
IND(OK) G L2
 
AFF1 
 S OK=0,DX=0,DY=22 X XY W $J(" ",79)
 
 S MODEL=$$MODEL^%QSMODEL
 I MODEL="" D ^%VZEAVT($$ERMODEL^%QSMODEL) G END
 I '($D(^[QUI]RQSAUTOR(WHOIS))) D ^%VZEAVT($$ERMODEL^%QSMODEL) G END
 S B=""
 F %B=0:0 S B=$O(^[QUI]RQSAUTOR(WHOIS,B)) Q:B=""  S:(B'="z")&(B'="LIEN") @LBASE@(B)=""
 F %B="ATTRIBUT","REQUETE","LISTE" K @LBASE@(%B)
 S DX=0,DY=5 X XY D BLD^%VVIDEO,BLK^%VVIDEO W "REPERTOIRE(s)" D NORM^%VVIDEO
 D INIT^%QUCHOI6(LBASE,1,"",0,6,26,15)
L0 D AFF^%QUCHOI6
 S REP=$$UN^%QUCHOI6 I REP="" D END^%QUCHOI6 G END
 S BASI=$$NOMINT^%QSF(REP) I BASI="" D END^%QUCHOI6 G END
 I $$REPVID^%QSGEST5(BASI) D ^%VZEAVT($$^%QZCHW("Ensemble vide")) G L0
 
AFF2 
 K @(LLIEN)
 D LIEN^%QSGEST9(BASI,LLIEN)
 S INTER="" F %U=0:0 S INTER=$O(@LLIEN@(INTER)) Q:INTER=""  D NET
 S DX=27,DY=5 X XY D BLD^%VVIDEO,BLK^%VVIDEO W "LIEN(s)" D NORM^%VVIDEO
 D INIT^%QUCHOI6(LLIEN,1,"",27,6,26,15)
L1 D AFF^%QUCHOI6
 S LIEN=$$UN^%QUCHOI6 I LIEN="" D END^%QUCHOI6 G L0
AFF3 
 S DX=54,DY=5 X XY D BLD^%VVIDEO,BLK^%VVIDEO W "INDIVIDU(s)" D NORM^%VVIDEO
 D INIT^%QUCHOIP($$LISTIND^%QSGEST6(BASI),1,"",54,6,26,15)
L2 D AFF^%QUCHOI6
 S IND=$$UN^%QUCHOI6 I IND="" D END^%QUCHOI6 G L1
 G FIN
 
NET Q:(((INTER'["LIEN.")&(INTER'["INVERSE."))&(INTER'["SOURCE."))&(INTER'["DESTINATION.")
 K @LLIEN@(INTER)
 Q
 
FIN S OK=1 Q
 
END S OK=0 Q
 
REAFF 
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("Liens de structure"))
 S DX=0,DY=5 X XY D BLD^%VVIDEO,BLK^%VVIDEO W "REPERTOIRE(s)" D NORM^%VVIDEO
 D INIT^%QUCHOI6(LBASE,1,"",0,6,26,15)
 D AFF^%QUCHOI6,END^%QUCHOI6
 S DX=27,DY=5 X XY D BLD^%VVIDEO,BLK^%VVIDEO W "LIEN(s)" D NORM^%VVIDEO
 D INIT^%QUCHOI6(LLIEN,1,"",27,6,26,15)
 D AFF^%QUCHOI6,END^%QUCHOI6
 S DX=54,DY=5 X XY D BLD^%VVIDEO,BLK^%VVIDEO W "INDIVIDU(s)" D NORM^%VVIDEO
 
 
 Q
 
 
CONS() 
 N ORDRE,TABL,TYPE,%U
 D ^%VZEATT S TOTAL=0
 S TABL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LIEN") K @(TABL)
 
 D MVG^%QSCALVA(BASI,IND,LIEN,TABL,.TYPE)
 S TOTAL=@TABL
 I TOTAL=0 D ^%VZEAVT($$^%QZCHW("Aucun lien")_" "_LIEN_" "_$$^%QZCHW("n'a ete defini pour l'individu")_" "_IND_"...") Q 0
 K @(GLOBAL)
 S ORDRE=""
 F %U=1:1 S ORDRE=$O(@TABL@(ORDRE)) Q:ORDRE=""  S @GLOBAL@(%U)=@TABL@(ORDRE)
 K @(TABL)
 Q 1
 
 
MENU(MN) 
 S @MN@(1)=$$^%QZCHW("+")_"^SUIV",@MN@(1,"EQU")="="
 S @MN@(2)=$$^%QZCHW("-")_"^PREC"
 S @MN@(3)=$$^%QZCHW("Attributs du lien")_"^ATT"
 S @MN@(4)=$$^%QZCHW("Visu d'arbre")_"^"_"ARB"
 S @MN@(5)=$$^%QZCHW("Suppression")_"^DEL"
 S @MN@(6)=$$^%QZCHW("Numero")_"^NUM"
 S @MN@(7)=$$^%QZCHW("Fin")_"^FIN"
 Q

