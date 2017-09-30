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

;%QMCPAC^INT^1^59547,73876^0
QMCPAC ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
IND(STRUCT,COOR,WHOIS1,QUI1,LISTE,WHOIS2,QUI2,KILL,XMODE,PASSE,ERR,OK) 
 N TEMP,ADRLIS,BASE1,ECR
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ACT") K @(TEMP)
 S OK=1
 
 
 S OK=$$COOR^%QMCP5(STRUCT,COOR,LISTE,ERR,XMODE)
 I '(OK) D FIN(TEMP) Q
 
 I PASSE=1,XMODE=3 S ECR=$$^%QMCP22(STRUCT,COOR,QUI2,"SAUVEGARDE",ERR)
 I PASSE=1 D FIN(TEMP) Q
 
 I XMODE'=3,@STRUCT@("VERIFICATION") S ECR=$$^%QMCP22(STRUCT,COOR,QUI2,"VERIFICATION",ERR) I ECR,'(KILL) D FIN(TEMP) S OK=0 Q
 
 I XMODE'=3,@STRUCT@("DESTRUCTION") S ECR=$$^%QMCP22(STRUCT,COOR,QUI2,"DESTRUCTION",ERR)
 
 S ADRLIS=$$ADRLIS^%QMCPZ(WHOIS1,QUI1,LISTE)
 S BASE1=$$BASE^%QMCPZ(WHOIS1,QUI1,LISTE)
 I XMODE'=3 D ^%QMCP1(WHOIS1,QUI1,ADRLIS,BASE1,STRUCT,COOR,WHOIS2,QUI2,"",1,2)
 I XMODE=3 D ^%QMCP1(WHOIS1,QUI1,ADRLIS,BASE1,STRUCT,COOR,WHOIS2,QUI2,"",3,2)
 Q
FIN(TEMP) 
 K @(TEMP) Q
 
 
 
 
 
 
COPIND(COPIE,DEFB,DEFI,LISTE,KILL,XMODE,PASSE,ERR,OK) 
 N TEMP,COOR,STRUCT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COPIND")
 S COOR=$$CONCAS^%QZCHAD(TEMP,"COOR")
 K @(TEMP)
 I '($$OKANA^%QMCPZ(COPIE)) D SAUT^%VPRIN1(ERR,2),ADD^%VPRIN1(ERR,$$^%QZCHW(COPIE_" "_$$^%QZCHW("n'existe pas ou n'est pas une definition de copie valide"))),SAUT^%VPRIN1(ERR,1),FIN(TEMP) S OK=0 Q
 S STRUCT=$$ADRSTR^%QMCPZ(COPIE)
 S QUI1=$O(@STRUCT@("QUI",""))
 S QUI2=@STRUCT@("QUI",QUI1)
 S WHOIS1=@STRUCT@("WHOIS1")
 S WHOIS2=@STRUCT@("WHOIS2")
 D RENOM^%QMCP5(STRUCT,WHOIS1,QUI1,QUI1,DEFB,DEFI,COOR)
 D IND(STRUCT,COOR,WHOIS1,QUI1,LISTE,WHOIS2,QUI2,KILL,XMODE,PASSE,ERR,OK)
 D FIN(TEMP)
 Q
 
 
COPY(WHOIS1,QUI1,LISTE,WHOIS2,QUI2,KILL,XMODE,PASSE,ERR,OK) 
 N TEMP,STRUCT,COOR,BASE1
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COPY")
 S COOR=$$CONCAS^%QZCHAD(TEMP,"COOR")
 S STRUCT=$$CONCAS^%QZCHAD(TEMP,"STRUCT")
 K @(TEMP)
 
 S BASE1=$$BASE^%QMCPZ(WHOIS1,QUI1,LISTE)
 I BASE1="" D SAUT^%VPRIN1(ERR,2),ADD^%VPRIN1(ERR,$$^%QZCHW("impossible de retrouver le repertoire des individus de la liste")_" "_LISTE),SAUT^%VPRIN1(ERR,1),FIN(TEMP) S OK=0 Q
 
 D FAMILLE^%QMCP8(STRUCT,WHOIS1,QUI1,BASE1,"S")
 D STOWQ^%QMCP5(STRUCT,WHOIS1,QUI1,BASE1,WHOIS2,QUI2,1,1)
 D IND(STRUCT,COOR,WHOIS1,QUI1,LISTE,WHOIS2,QUI2,KILL,XMODE,PASSE,ERR,OK)
 D FIN(TEMP)
 Q

