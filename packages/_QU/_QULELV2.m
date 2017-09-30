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

;%QULELV2^INT^1^59576,36940^0
%QULELV2 ;;03:04 PM  16 Nov 1992; ; 15 Dec 92  3:09 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
INIT2(TEMP,G,RO,LARA,LART,GLOUC,TIT,IDFC,NOFIN) 
 N TEMPUC,TTR,LGCOL,PROC,%AA,%BB,%CC,%DD,%EE,AFF,Y,OKCONS,LEVEL,OBCOUR,DCC,DLC,BDP,COM,OR,X
 
 N COLAF,LIGAF,CDEB,LDEB,AFFL,EXEFULL,AFFD
 
 N GY,GYINV,EXT,TABOPT,TPAR,UCO,PILBUF
 D GETADR^%QULELV
 S:'($D(NOFIN)) NOFIN=0
 D COPY^%QCAGLC(GLOUC,UCO)
 S @PILBUF=0
 D CHGPK^%PKUTIL,OPTIONS^%QULELVW
 S LIGAF=$S($D(@UCO@("INFO")):12,1:14),COLAF=((((PK("C")-6)-LARA)\(LARA+LART))*2)+1
 S AFFL=(4+(((COLAF\2)+1)*LARA))+((COLAF\2)*LART),AFFD=((PK("C")-AFFL)+1)\2
 
 
 S EXEFULL=$S('($D(@UCO@("FULL"))):"S AFF=@GY@(CC,LC,""C"")",1:"S AFF="_@UCO@("FULL")_"(TPAR)")
 
 D CONS^%QULELVX(G,RO,GY,GYINV,$S($D(@UCO@("TRI")):@UCO@("TRI"),1:""))
 S (LDEB,CDEB)=1
 F %AA="G","RO","COLAF","LIGAF","TIT","CDEB","LDEB","LARA","LART","AFFL","EXEFULL","AFFD","IDFC" S @TEMP@("VAR",%AA)=@%AA
 S @TEMP@("VAR","OR")=1
 F %AA=1:1 Q:'($D(BDP(%AA)))  S @TEMP@("BDP",%AA)=BDP(%AA),@TEMP@("COM",%AA)=COM(%AA)
 D RETMOD^%PKUTIL
 Q
 ;
 ;

