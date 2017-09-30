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

;%PBELLI1^INT^1^59547,73873^0
PTELLIP1() 
 
 N %8,%81,%82,%8ALF,%9ARC,%9ASX,%8BDET,%8CALF,%8COS,%8CDEL,%8DI1,%8DI2,%8DI3,%8DI3,%8DI6,%8DI7,%8DI8,%8DI10,%8GA,%9I2,%8IT,%8OK,%8OX,%8OY,%8SALF,%8SIN,%8SDEL
 N %X,%XX,%9XAC1,%8XC1,%8XC2,%8XC3,%8XC4,%9XD1,%9XD2,%Y,%9YAC1,%8YC1,%8YC2,%8YC3,%8YC4,%9YD1,%9YD2
 S %9XAC1=%9X,%9YAC1=%9Y,%9I2=((%9I-90)+360)#360,%X=(%9DR*%9DR)+(%9PR*%9PR),%Y=$$SQR^%TLCAMTH(%X),%8DI1=%Y,%8OX=%9XAC1,%8OY=%9YAC1,%X=%9I2,%XX=$$COS^%TLCAMTH(%X),%8COS=%XX,%X=%9I2,%XX=$$SIN^%TLCAMTH(%X),%8SIN=%XX,%8CDEL=-(%8SIN),%8SDEL=%8COS
 S %8SIN=%XX,%8CALF=%9PR/%8DI1,(%9ASX,%8SALF)=%9DR/%8DI1,%9ARC=$$ARCSIN^%TLCAMTH(%9ASX),%8ALF=%9ARC,%8GA=%9I,%8BET=90-%8ALF,%8DI2=((%8DI1-%9PR)+%9DR)/2,%8DI3=%8DI2/%8CALF,%8DI6=(%9PR-%8DI3)/%8SALF,%8DI7=%8DI6*%8CALF,%8DI8=%8DI7+%9DR
 S %8DI10=%9PR-%8DI3,%8XC1=%8OX+(%8DI10*%8CDEL),%8YC1=%8OY+(%8DI10*%8SDEL),%8XC3=%8OX-(%8DI7*%8COS),%8YC3=%8OY-(%8DI7*%8SIN),%8XC2=(2*%8OX)-%8XC1,%8YC2=(2*%8OY)-%8YC1,%8XC4=(2*%8OX)-%8XC3,%8YC4=(2*%8OY)-%8YC3,%9XAC1=%8OX,%9YAC1=%8OY
 K %8ELIPS G @%9END
40 S %81=%9I2+%8ALF,%82=%81+(2*%8BET)
 S %8ELIPS("E",1)=%8XC1_"^"_%8YC1_"^"_(%81#360)_"^"_(%82#360)_"^"_%8DI3,%81=%82,%82=%81+(2*%8ALF)
 S %8ELIPS("E",2)=%8XC4_"^"_%8YC4_"^"_(%81#360)_"^"_(%82#360)_"^"_%8DI8,%81=%82,%82=%81+(2*%8BET)
 S %8ELIPS("E",3)=%8XC2_"^"_%8YC2_"^"_(%81#360)_"^"_(%82#360)_"^"_%8DI3,%81=%82,%82=%9I2+%8ALF
 S %8ELIPS("E",4)=%8XC3_"^"_%8YC3_"^"_(%81#360)_"^"_(%82#360)_"^"_%8DI8,%X=4 G VR
20 S %81=%9I,%82=%9I+%8BET
 S %8ELIPS("E",1)=%8XC1_"^"_%8YC1_"^"_(%81#360)_"^"_(%82#360)_"^"_%8DI3,%81=%82,%82=%81+(2*%8ALF)
 S %8ELIPS("E",2)=%8XC4_"^"_%8YC4_"^"_(%81#360)_"^"_(%82#360)_"^"_%8DI8,%81=%82,%82=%81+%8BET,%8XC3=%8XC4,%8YC3=%8YC4
 S %8ELIPS("E",3)=%8XC2_"^"_%8YC2_"^"_(%81#360)_"^"_(%82#360)_"^"_%8DI3,%X=3
VR S %8OK=1 F %8=1:1:%X D V0 Q:%8OK=0
FIN Q %8OK
V0 S %9XD1=@("%8XC"_%8),%9YD1=@("%8YC"_%8)
 I (%9XD1<10)!((%9XD1>4000)!((%9YD1<10)!(%9YD1>3000))) S %8OK=0
 Q

