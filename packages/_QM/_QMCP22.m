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

;%QMCP22^INT^1^59547,73876^0
QMCP22(STRUCT,COOR,QUI2,MODE,ERR) 
 
 
 
 
 
 N BASE1,IND1,I,BASE2,IND2,VISU,ECRASE,T
 S T=$C(9)
 S VISU=1,ECRASE=0
 D:VISU POCLEPA^%VVIDEO
 S BASE1=$O(@COOR@(""))
 F I=0:0 Q:BASE1=""  D T1 S BASE1=$O(@COOR@(BASE1))
 I MODE="SAUVEGARDE" D STOLK^%QMCPOZ(QUI,"COORF")
 Q ECRASE
T1 S BASE2=@STRUCT@("S",BASE1,"BDI")
 I MODE="VERIFICATION" D SAUT^%VPRIN1(ERR,2),ADD^%VPRIN1(ERR,"***** "_$$NOMLOG^%QMCPZ(WHOIS2,QUI2,BASE2)_" *****"),SAUT^%VPRIN1(ERR,1)
 S IND1=$O(@COOR@(BASE1,""))
 F I=0:0 Q:IND1=""  D T2 S IND1=$O(@COOR@(BASE1,IND1))
 Q
T2 S IND2=@COOR@(BASE1,IND1) W:VISU "."
 I MODE="SAUVEGARDE" D STOLK^%QMCPOZ(QUI,"COOR"_T_BASE2_T_IND2)
 I '($$IR^%QMCPZ(WHOIS2,QUI2,BASE2,IND2)) Q
 D:MODE="DESTRUCTION" SX^%QMCPZ(WHOIS2,QUI2,BASE2,IND2)
 I MODE="VERIFICATION" D ADD^%VPRIN1(ERR,$$NOMLOG^%QMCPZ(WHOIS2,QUI2,BASE2)_" "_IND2_" "_$$^%QZCHW("existe deja")) S ECRASE=1
 Q

