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

;TOCMSOP^INT^1^59547,74871^0
TOCMSOP ;
 S %AJCMS=$$^%QZCHW("Cons/Mod/Sup")
 D START,CURRENT^%IS,ZD^%QMDATE4 K X1 S NOMTAB="^[QUI]ETUDLAN",SCR="ETUDLAN",ROUTI="^%VMULTGE(.IFLAG)"
 S NOMPROG=$T(+0)
 S NOMAP=$E(NOMPROG,4,$L(NOMPROG)),NOMPROG="^"_NOMPROG
 S NOMAJ="^AJ"_NOMAP
 D ^TO3RECON G FIN:ABENDSCR=1
LOOP1 D POCLEPA^%VVIDEO,CLEBAS^%VVIDEO W $$^%QZCHW("(I)nstruction,(R)etour atelier ")
LOOP2 R *X1 D TOUCHE^%INCCLAV(X1,.X1) G TOCMSOP:X1=6,FIN:X1<2
 S:X1>91 X1=X1-32 S ISN=$S(X1=82:"R",X1=73:"I",1:"LOOP1"),DX=1,DY=23 D CLEBAS^%VVIDEO
 G:ISN="LOOP1" LOOP1 S SCR=$S(ISN="R":"RETATEL",1:"FICHINST"),NOMTAB="^[QUI]"_SCR
 D CLEBAS^%VVIDEO
LOOP 
RES S RS=@NOMTAB@(NUFA,YB,NUC,NUAP,DELAI) D RES^%VKAUTGE
 S DX=0,DY=15 X XY D CLEBAS^%VVIDEO,LOOP^%VAFIGRI,BLD^%VVIDEO,^%VAFISCR,NORM^%VVIDEO,^TOCMSCMG G LOOP1:X1=6,TOCMSOP:X1<2
FIN K CMS U 0 Q
START I '(DTM) K (COUNT,FF,MA,PIM,PIMEN,QUI,WHOIS,SUB,%PROGEX) D VARSYS^%QCSAP
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="COUNT","FF","MA","PIM","PIMEN","QUI","WHOIS","SUB","%PROGEX","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125 D VARSYS^%QCSAP Q

