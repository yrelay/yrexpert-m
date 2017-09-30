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

;%MZHLP1^INT^1^59547,73872^0
MOZHLP1 ;
 
 
 
 
 
 
BEG D CURRENT^%IS S V80=0
 S:'($D(XOP)) XOP=3
 S @%TT@($J,0,EDCL)=XOP_"^"_X,NYS=21
 D:(XOP=1)!(XOP=2) NORM^%VVIDEO
DEB D CLEPAG^%VVIDEO
 S DY=1,MSG="A l'aide...",DX=13-($L(MSG)\2) X XY W MSG
 D CARSP^%VVIDEO(8,3,3,10,1),REV^%VVIDEO S DX=9,DY=4 X XY W " MOZART " X XY D NORM^%VVIDEO
CH D CARSP^%VVIDEO(0,7,14,53,1) S DY=8,DX=1
 G:IBMPC AFF0
 F %U=0:1 S LIB=$P($T(HLP+%U),";;",2) Q:LIB=""  X XY W LIB S ^MOZCH($J,DY)=LIB,DY=DY+1
 G FIN
AFF0 G:'(MODTM) AFF1
 F %U=0:1 S LIB=$P($T(HLP2+%U),";;",2) Q:LIB=""  X XY W LIB S ^MOZCH($J,DY)=LIB,DY=DY+1
 G FIN
AFF1 F %U=0:1 S LIB=$P($T(HLP3+%U),";;",2) Q:LIB=""  X XY W LIB S ^MOZCH($J,DY)=LIB,DY=DY+1
FIN S DX=5,DY=21 X XY W "[RETURN] " R *RET:^TOZE($I,"ATTENTE")
 K %U,%V D CLEPAG^%VVIDEO S DX=0,DY=0 X XY
 D STAT1^%MZWORD X XY D NORM^%VVIDEO,RF^%MZED,RST^%MZED
 O 0
 Q
HLP ;;CTRL A         : sortir sans sauvegarde
 ;;CTRL F         : sortir avec sauvegarde
 ;;CTRL G         : effacement d'une ligne
 ;;CTRL J         : impression de la gamme
 ;;CTRL K         : affichage de l'heure
 ;;CTRL L         : insertion d'une ligne
 ;;CTRL R         : rafraichissement de l'ecran
 ;;CTRL V         : rafraichissement du bas de l'ecran
 ;;CTRL Z         : acces aux differentes commandes
 ;;PF2            : aide no 2
 ;;
HLP2 ;;ESCP           : sortir sans sauvegarde
 ;;CTRL F         : sortir avec sauvegarde
 ;;CTRL G         : effacement d'une ligne
 ;;CTRL J         : impression de la gamme
 ;;CTRL T         : affichage de l'heure
 ;;CTRL L         : insertion d'une ligne
 ;;CTRL W         : rafraichissement de l'ecran
 ;;CTRL V         : rafraichissement du bas de l'ecran
 ;;CTRL Z         : acces aux differentes commandes
 ;;Alt  X         : aide no 2
 ;;
HLP3 ;;BREAK          : sortir sans sauvegarde
 ;;CTRL F         : sortir avec sauvegarde
 ;;CTRL G         : effacement d'une ligne
 ;;CTRL J         : impression de la gamme
 ;;CTRL T         : affichage de l'heure
 ;;CTRL L         : insertion d'une ligne
 ;;CTRL W         : rafraichissement de l'ecran
 ;;CTRL V         : rafraichissement du bas de l'ecran
 ;;CTRL Z         : acces aux differentes commandes
 ;;F18            : aide no 2
 ;;

