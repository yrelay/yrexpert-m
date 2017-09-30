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

;%EDCPREF^INT^1^59547,73869^0
%EDCPREF ;;05:12 PM  8 Jan 1992;
 
 
 
 
 N UU,LLA,LLH,PORT,TEXTE
 S UU=1/3527E-4,ORI="HORIZONTALE"
 S PORT=^TABIDENT(WHOIS,"TABTRA")
 S TERM=^TABIDENT(WHOIS,"TYPTAB")
DEBUT 
 W !,"largeur maxi de la feuille en "_ORI_" en cm (19.8)" R LLA
 W !,"hauteur maxi de la feuille en "_ORI_" en cm (28.3)" R LLH
 S:LLA="" LLA=198E-1
 S:LLH="" LLH=283E-1
CROIX 
 S CX=$J((LLA*5)*UU,1,0),CY=$J((LLH*5)*UU,1,0)
 O PORT
 U PORT W "/Courier findfont 12 scalefont setfont",!
 U PORT W "18 803 moveto",!
 U PORT W "(Reglage imprimante) show",!
 U PORT W "0.5 setlinewidth",!
 U PORT W "newpath "_(CX-50)_" "_CY_" moveto "_(CX+50)_" "_CY_" lineto stroke",!
 U PORT W "closepath",!
 U PORT W "newpath "_CX_" "_(CY-50)_" moveto "_CX_" "_(CY+50)_" lineto stroke",!
 U PORT W "closepath",!
 U PORT W "showpage",!
 C PORT U 0
 Q
 W "ECARTS ENTRE LE CENTRE DE LA CROIX ET LE CENTRE DE LA PAGE (en mm)",!
 W !,"ECART EN X " R ECARX
 W !,"ECART EN Y " R ECARY
 S TRSLTX=$J(ECARX*UU,1,0),TRSLTY=$J(ECARY*UU,1,0)
 S %LIMX=$J((LLA*UU)*10,1,0),%LIMY=$J((LLH*UU)*10,1,0)
 
 S ^%ENVIRON("POSTSCRIPT","INIT.VARIABLES")="S %UU=1/0.3527,%LIMXCM="_LLA_",%LIMYCM="_LLH_",%LIMX="_$J((LLA*UU)*10,1,0)_",%LIMY="_$J((LLH*UU)*10,1,0)_",%9O=""VERTICALE"",%9EPA=1,%TRSLTXH="_TRSLTXH_",%TRSLTYH="_TRSLTYH_",%TRSLTXV="_TRSLTXV_",%TRSLTYV="_TRSLTYV_"^^^^^^^^^^"
 Q

