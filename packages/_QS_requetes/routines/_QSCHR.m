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

;%QSCHR^INT^1^59547,73880^0
QSCHR ;
 
 
 
 
 
 
 
 
RECH() 
 N TROUVER,PROBLEME,CHOIX,TEMP,CTR,I,FONCT,CPT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S PROBLEME=$$CONCAS^%QZCHAD(TEMP,"PROBLEME")
 S TROUVER=$$CONCAS^%QZCHAD(TEMP,"TROUVER")
AFF D CLEPAG^%VVIDEO,^%VZCDB("RECHERCHE DANS LES REQUETES",0)
 D POCLEPA^%VVIDEO,LIRE2^%VREAD($$^%QZCHW("Donnez la chaine de caracteres a rechercher")_" : ","",9,RM-4,DY+1,DY-1,"","",.CTR,.FONCT)
 Q:CTR'="" 2
 Q:FONCT="" 2
 S CPT=0
 D CHANGE^%QSCHR2(FONCT,FONCT,0,0,0)
 G:CHOIX=-1 AFF
 I @TROUVER=0 D ^%VZEAVT($$^%QZCHW("Cette chaine de caractere n'est contenue dans aucune requete")_" ...") G AFF
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("RESULTATS DE LA RECHERCHE DANS LES REQUETES")_" ( "_@TROUVER_" "_$$^%QZCHW("cas")_" )",0)
 S DX=0,DY=2 X XY D BLD^%VVIDEO
 W $$^%QZCHW("Nom de la requete : Ligne  xxx -->       contenu de la ligne")
 D NORM^%VVIDEO
 D INIT^%QUCHOIP(TROUVER,1,"",0,4,80,18),AFF^%QUCHOIP
RESCH S I=$$UN^%QUCHOIP I I'="" G RESCH
 D END^%QUCHOIP
 G AFF
 
 
SUBST() 
 N MENU1,MENU2,TROUVER,PROBLEME,CHOIX,CPT,TEMP,CTR,I,FONCT,FONCT2,SUBSAT,AUTO,C
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S PROBLEME=$$CONCAS^%QZCHAD(TEMP,"PROBLEME")
 S TROUVER=$$CONCAS^%QZCHAD(TEMP,"TROUVER")
AFF2 D CLEPAG^%VVIDEO,^%VZCDB("SUBSTITUTION DANS LES REQUETES",0)
 S MENU1="22^5^79"
 S MENU1(1)=$$^%QZCHW("Attribut")_"^AT"
 S MENU1(1,"COM")=$$^%QZCHW("Remplacement du nom d'un attribut")
 S MENU1(2)=$$^%QZCHW("Chaine quelconque")_"^CH"
 S MENU1(2,"COM")="   "_$$^%QZCHW("Remplacement d'une chaine quelconque de caracteres")
TYPS S DX=0,DY=21 D CLEBAS^%VVIDEO
 S DY=23 X XY
 W $$^%QZCHW("Type substitution : ") D ^%VQUIKMN($X,78,23,"MENU1",.TYP,.CTR)
 Q:CTR'="" 2
 Q:TYP="" 2
 S SUBSAT=$S(TYP="AT":1,1:0)
CH1 D POCLEPA^%VVIDEO,LIRE2^%VREAD($$^%QZCHW("Remplacer la chaine de caracteres")_" : ","",0,RM-4,DY+1,DY-1,"","",.CTR,.FONCT)
 G:(CTR'="")!(FONCT="") TYPS
 G:'(SUBSAT) CH2
 S FONCT=$$GETLBLAN^%VTLBLAN(FONCT),C=$E(FONCT)
 I C'?1A D ^%VSQUEAK G CH1
CH2 D POCLEPA^%VVIDEO,LIRE2^%VREAD($$^%QZCHW("par")_" : ","",0,RM-4,DY+1,DY-1,"","",.CTR,.FONCT2)
 G:CTR'="" TYPS
 G:'(SUBSAT) MOD
 S FONCT2=$$GETLBLAN^%VTLBLAN(FONCT2),C=$E(FONCT2)
 I C'?1A D ^%VSQUEAK G CH2
MOD S MENU2="22^10^79"
 S MENU2(1)=$$^%QZCHW("ASSISTE")_"^0"
 S MENU2(1,"COM")=$$^%QZCHW("Confirmation avant chaque substitution")
 S MENU2(2)=$$^%QZCHW("AUTOMATIQUE")_"^1"
 S MENU2(2,"COM")="      "_$$^%QZCHW("Substitution automatique")
 S DX=0,DY=21 D CLEBAS^%VVIDEO
 D POCLEPA^%VVIDEO W $$^%QZCHW("Mode : ") D ^%VQUIKMN($X,78,23,"MENU2",.AUTO,.CTR)
 I (CTR="A")!(CTR="F") G TYPS
 S CPT=0
 D CHANGE^%QSCHR2(FONCT,FONCT2,1,AUTO,SUBSAT)
 I @PROBLEME=0 G AFF2
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("PROBLEMES DE REANALYSE"),0)
 D INIT^%QUCHOIP(PROBLEME,1,"",0,3,80,19),AFF^%QUCHOIP
RESUB S I=$$UN^%QUCHOIP I I'="" G RESUB
 D END^%QUCHOIP
 G AFF2

