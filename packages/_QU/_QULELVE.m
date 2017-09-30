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

;%QULELVE^INT^1^59547,73885^0
%QULELVE ;;05:55 PM  2 Dec 1992; ; 02 Dec 92  5:56 PM
 
 
 
 
 
 
 
 
ELEME(TEMP,OBJ) 
 
 N CC,LC,%AA,%BB,TB,X
 N Y,TTR,%CC,TW,TF,TC,TD,TT
 
 N G,RO,LARA,LART,TIT,COLAF,LIGAF,CDEB,LDEB,AFFL,EXEFULL,AFFD,IDFC
 
 N GY,GYINV,EXT,TABOPT,TPAR,UCO,PILBUF
 
 D GETADR^%QULELV
 S %AA="" F %BB=0:0 S %AA=$O(@TEMP@("VAR",%AA)) Q:%AA=""  S @(%AA_"=@TEMP@(""VAR"",%AA)")
 D CHGPK^%PKUTIL
 D INITRE^%QULELVZ
 D VARGPK^%QULELVZ
 
 I '($$POSSIMP^%QULELVX(OBJ,.CC,.LC)) Q
 I $D(@TEMP@("VALY"))<10 D FDPAGE^%QULELVZ G ELREMA
 I (((CC<CDEB)!(LC<LDEB))!(CC'<(CDEB+COLAF)))!(LC'<(LDEB+LIGAF)) G ELREMA
 I $D(@TEMP@("X")) S X=@TEMP@("X"),TB(X)=@TEMP@("VALY",X) D NORMX^%QULELVZ
 S X=((LC-LDEB)+2)+((LIGAF+2)*((CC-CDEB)+1)),TB(X)=@TEMP@("VALY",X) D AFFX^%QULELVZ
 S @TEMP@("X")=X
 F %AA="CDEB","LDEB","CC","LC" I $D(@%AA) S @TEMP@("VAR",%AA)=@%AA
 D RETMOD^%PKUTIL Q
 
 
ELREMA S CDEB=CC,LDEB=LC D MAKEVUE^%QULELVZ,AFFVUE^%QULELVZ
 S X=LIGAF+4 D AFFX^%QULELVZ
 
 S %AA="" F %BB=0:0 S %AA=$O(TB(%AA)) Q:%AA=""  S @TEMP@("VALY",%AA)=TB(%AA)
 S @TEMP@("X")=X
 F %AA="CDEB","LDEB","CC","LC" I $D(@%AA) S @TEMP@("VAR",%AA)=@%AA
 D RETMOD^%PKUTIL
 Q
 ;
 ;

