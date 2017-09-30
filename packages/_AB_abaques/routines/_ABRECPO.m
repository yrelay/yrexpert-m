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

;%ABRECPO^INT^1^59547,73864^0
%ABRECPO ;
 
 K T,LOCA S CTE=0,XDP1=$E(XDP,1,2),XDP2=$E(XDP,$L(XDP)-1,$L(XDP)) I XDP1="(""",XDP2=""")" S XDPP=$E(XDP,3,$L(XDP)-2) I XDPP'["""" S CTE=1,LOCA(1)=1,LOCA(2)=$L(XDP),T(1)="(",T($L(XDP))=")" G FINI
L K T,LOCA,MA,MI S IX=1 F I="_",",","#","+","*","-","/","\","[","]","(",")","&","!","<",">","=" S POSI=1 F Z1=0:0 S POSI=$F(XDP,I,POSI) Q:POSI=0  S LOCA(IX)=POSI-1,T(LOCA(IX))=I S:I="[" MI(POSI-1)=IX S:I="]" MA(POSI-1)=IX S IX=IX+1
FINI K XDP1,XDP2,XDPP Q
CORRECT I CTE=1 S AOPERAT=0,CORRECT=1,NOLIT=0 G END
 S AOPERAT=0,CORRECT=1,NOLIT=1 F I="#","+","*","-","/","\","[","]","&","!","<",">","=" I XDP[I S AOPERAT=1 G FIN
FIN I (XDP["$$")&(XDP["""") S NOLIT=0 G END
 I (XDP'["_")&(AOPERAT=1) S NOLIT=1 G END
 I (XDP["_")&(AOPERAT=1) S CORRECT=0 G END
 I (XDP'["_")&(AOPERAT=0) S NOLIT=0 G END
 S NOLIT=0
END Q

