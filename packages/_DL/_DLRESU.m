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

;%DLRESU^INT^1^59547,73868^0
DLRESU ;
 
 
 
 
STOCK(LIB,IDAR,OPRES,LISRES) 
 N ATJAL,DA,ROP,NR,EXART,MONT,I,%I,TEMP,REP,ATR
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 K @(TEMP)
 S I=""
 F %I=0:0 S I=$O(@OPRES@(I)) Q:I=""  S @TEMP@(@OPRES@(I,2),I)=""
 S MONT=LISRES'=""
 S NBAJ=$$^%QCAZG("NBAJ")+1
 G:'(MONT) AFB
 S ROP=$$ROP^%DLCON2
 S EXART=$$RART^%DLCON2
 S NR=$S($D(@LISRES):@LISRES,1:0)
 S NR=NR+1
 S @LISRES@(NR)="   ",NR=NR+1
 S @LISRES@(NR)=EXART_" "_IDAR,NR=NR+1
 S @LISRES@(NR)=$TR($J(" ",$L(@LISRES@(NR-1)))," ","-"),NR=NR+1
 S @LISRES@(NR)="  "_LIB
 S REP=$$LAN^%DLCON2
 S ATR=$$DATEJAL^%DLCON2
 S D=""
 I SENS=-1 G AM
AV 
 S D=$O(@TEMP@(D)) I D="" G FRES
 S DA=$$AFFI^%QMDAUC(REP,ATR,D)
 S I=""
 F %I=0:0 S I=$O(@TEMP@(D,I)) Q:I=""  D AFFVIS
 G AV
AM 
 S D=$ZP(@TEMP@(D)) I D="" G FRES
 S DA=$$AFFI^%QMDAUC(REP,ATR,D)
 S I=""
 F %I=0:0 S I=$O(@TEMP@(D,I)) Q:I=""  D AFFVIS
 G AM
 
FRES S @LISRES=NR
 
AFB K @(TEMP)
 Q
 
AFFVIS S NR=NR+1
 S @LISRES@(NR)=ROP_" "_COMPOSANT_","_@OPRES@(I)
 S NR=NR+1
 S @LISRES@(NR)="     "_$$^%QZCHW("machine")_" "_@OPRES@(I,3)_" "_$$^%QZCHW("date jalon")_" "_DA_" "_$$^%QZCHW("ressource")_" "_@OPRES@(I,1)
 I @OPRES@(I,5)'="" S NR=NR+1,@LISRES@(NR)="     "_@OPRES@(I,5)
 K @OPRES@(I,5)
 Q
 
 
 
 
PREC(PLPREC,OPRES) 
 N I,TEMP,NOP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CORR")
 K @(TEMP)
 S I=""
 F %I=0:0 S I=$O(@OPRES@(I)) Q:I=""  S @TEMP@(@OPRES@(I,10))=I
 B "L"
 S I=$O(@OPRES@(""))
 G:I="" FPREC
 S NOP=@OPRES@(I,10)
 K @OPRES@(I,10)
 S I2=I
BPREC S I=$O(@OPRES@(I))
 G:I="" FPREC
 I @OPRES@(I,10)=NOP S @OPRES@(I,10)=I2,I2=I G BPREC
 S I2=I,NOP=@OPRES@(I,10)
 I '($D(@PLPREC@(@OPRES@(I,10)))) K @OPRES@(I,10) G BPREC
 S PREC=$O(@PLPREC@(@OPRES@(I,10),""))
 S @OPRES@(I,10)=@TEMP@(PREC)
 G BPREC
 
FPREC K @(TEMP)
 Q

