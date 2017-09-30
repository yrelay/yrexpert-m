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
;! Nomprog     : %QCSDIR                                                      !
;! Module      :                                                           !
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

;%QCSDIR ;
ZDYR() 
 
 N %DIR
 D INT^%DIR Q %DIR
 
DIRSYS(HOST) 
 Q $$PCONF^%INCASTO("PSYS")
 
 I HOST="VAX" Q "SYS$M"
 I HOST="PDP" Q "MG"
 I HOST="C-IBM PC" Q $$PCONF^%INCASTO("PSYS")
 Q ""
 
LDIR(HOST,ADR) 
 N SYS,I,A,PSYS
 S SYS=""
 S HOST=$$PCONF^%INCASTO("TYPHOST")
 S PSYS=$$PCONF^%INCASTO("PSYS")
 S SYS=$$GSYS(HOST,PSYS)
 Q:SYS=""
 S A=$O(@SYS@(""))
 F I=0:0 Q:A=""  S @ADR@(A)="",A=$O(@SYS@(A))
 Q
 
GSYS(HOST,PSYS) 
 N SYS
 S SYS=""
 I HOST="PDP" S SYS="^["_$$S1^%QZCHAD(PSYS)_"]SYS(""DIR"")"
 I HOST="VAX" S SYS="^["_$$S1^%QZCHAD(PSYS)_"]SYS(""UCI"")"
 ;HL2 I HOST="C-IBM PC" S SYS="^["_$$S1^%QZCHAD(PSYS)_"]SYS(""UCI"")"
 I HOST="C-IBM PC" S SYS="^SYS(""UCI"")"
 Q SYS
 
DIR(HOST,DIR) 
 G EXIST2^%QCSCDIR
%UCI S %UCI=$$ZDYR Q

