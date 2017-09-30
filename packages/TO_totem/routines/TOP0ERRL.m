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

;TOP0ERRL^INT^1^59547,74873^0
TOP0ERRL ;
 
 S EL=(DZA\1)#2,RW=(DZA\2)#2,WP=(DZA\4)#2,BOT=(DZA\32)#2,ONL=(DZA\64)#2,NXM=(DZA\128)#2,BT=(DZA\256)#2,RL=(DZA\512)#2,EOT=(DZA\1024)#2,BGL=(DZA\2048)#2,PCRC=(DZA\4096)#2,TC=(DZA\8192)#2,TM=(DZA\16384)#2,TNR=(DZA\32768)#2
FIN Q
INT 
 S %X=2 F %IIMESS=0:1:15 S %N=%IIMESS,%P=$$PUIS^%TLCAMTH(%X,%N),J=(DZA\%P)#2 W:J !,$P($T(0+%N),";;",2,999)
 Q
0 ;;0	" Logical Error - mixed Reads and Writes"
1 ;;1	" Rewinding"
2 ;;2	" Write Protected"
3 ;;3	" Error Summary"
4 ;;4	" Density TE16 - 0: 800 bpi, 1: 1600 bpi"
5 ;;5	" Beginning of Tape"
6 ;;6	" On Line"
7 ;;7	" NXMEM"
8 ;;8	" Bad Tape error"
9 ;;9	" Record Lenght Error"
10 ;;10	" End of Tape"
11 ;;11	" Bus Grant Late"
12 ;;12	" Parity or CRC Error"
13 ;;13	" Tape Controller Error"
14 ;;14	" Tape Mark"
15 ;;15	" Tape Not Ready"

