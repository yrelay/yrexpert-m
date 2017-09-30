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

;TOPARTEX^INT^1^59547,74874^0
TOPARTEX ;
 
 K ^[QUI]WPSCR($J) S %TAB="^[QUI]WPSCR($J)"
 S @%TAB@("NOMPRODUIT")=$S($D(^[QUI]TREEWORK(NUFA,0)):$P(^[QUI]TREEWORK(NUFA,0),"^",4),1:""),@%TAB@("NOMCLICHE")=NUFA,@%TAB@("DATE")=%DAT1
 F %UU=1:1 S LIG=$T(PARA+%UU) Q:LIG=""  S %TV=$P($P(LIG,";;",2),"/",1),LIG=$P(LIG,"/",2) F %VV=1:1 S BIPAR=$P(LIG,";",%VV) Q:BIPAR=""  S PT=$P(BIPAR,"=",1),BP=$P(BIPAR,"=",2),JT=$P(BP,"~",2),BP=$P(BP,"~",1) D AFF
 G GETOP
AFF S @%TAB@(PT)=$S($D(@%TV@(BP)):@%TV@(BP),1:"") I JT'="" S @%TAB@(PT)=$J(@%TAB@(PT),10,JT)
 Q
GETOP S OP="OP",CS="CONSIGNE",NU=1,PH=-1
 F %UU=1:1 S PH=$N(^[QUI]PHAS(NUFA,0,PH)) Q:PH=-1  S OPC=^[QUI]PHAS(NUFA,0,PH),OPR=$P(OPC,"/",1),@%TAB@(OP_NU)=OPR,@%TAB@(CS_NU)=$S($D(^[QUI]CONS(NUFA,0,OPC)):$TR(^[QUI]CONS(NUFA,0,OPC),"|","/"),1:""),NU=NU+1
FIN K %TAB,%TV,%UU,%VV,LIG,BIPAR,PT,BP,OP,CS,NU,PH,OPC,OPR Q
PARA 
 ;;^[QUI]TVPAR(NUFA,0)/ALLIAGE=ALLIAGE;ALLIAGEFABR=ALLIAGE.FABRIQUE;ETAT=ETAT;ETATREALISE=ETAT.REALISE
 ;;^[QUI]TVPAR(NUFA,0)/EPCOMMAND=EPAISSEUR.COMMANDEE~2;LARGCOMMAND=LARGEUR.COMMANDEE~1;LONGCOMMAND=LONGUEUR.COMMANDEE~1;EPMAXIE=EPAISSEUR.MAXI~2;LARMAXI=LARGEUR.MAXI~1;LONGMAXI=LONGUEUR.MAXI~1
 ;;^[QUI]TVPAR(NUFA,0)/CLIENT=CLIENT;EPMINI=EPAISSEUR.MINI~2;LARGMINI=LARGEUR.MINI~1;LONGMINI=LONGUEUR.MINI~1;EPVISEE=EPAISSEUR.VISEE~2;LARGVISEE=LARGEUR.VISEE~1
 ;;^[QUI]TVPAR(NUFA,0)/LONGVISEE=LONGUEUR.VISEE~1;TYPECOLIS=TYPE.DE.COLIS;NORME=NORME;NORMEDIMMENS=NORME.DIM;MATIERE=MATIERE;EPEBAUCHEACHAUD=EPAISSEUR.EBAUCHE.A.CHAUD~2
 ;;^[QUI]PARMAT(NUFA,0)/LONGBONPLAT=LONGUEUR.BONNE.DU.PLATEAU;LARGAULAMINAGE=LARGEUR.AU.LAMINAGE~1

