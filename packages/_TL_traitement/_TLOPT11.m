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

;%TLOPT11^INT^1^59547,74030^0
%TLOPT11 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
HISTOGR(IDEB,NBREG) 
 N MES,GLH,TYPH,NOMH,LISTE,TOT1,REG1,N1,P1,ABC,HTOT
 N TOT2,ABC2,HTOT2,REG2,N2,P2
 S GLH=$$ADRHIS^%HXIHITU
 
 S TYPH=V(IDEB)
 
 S NOMH=V(IDEB+1)
 
 I NOMH="" S NOMH=$$GEN^%QCAPOP("HIS")
 I $$EXHIS^%HXIHITU(GLH,NOMH) D SUP^%HXIHITU(NOMH)
 
 S LISTE=V(IDEB+2)
 
 S TOT1=V(IDEB+3)
 I V(IDEB+5)'="" S REG1=TOT1_"^"_V(IDEB+5)
 
 S REG1=V(IDEB+6)
 I V(IDEB+8)'="" S REG1=REG1_"^"_V(IDEB+8)
 
 S N1=V(IDEB+9)
 S P1=V(IDEB+10)
 
 S ABC=V(IDEB+11)
 
 S HTOT=V(IDEB+12)
 I TYPH=1 S MES=$$HSIM^%HXIHITR(GLH,NOMH,TYPH,LISTE,TOT1,REG1,N1,ABC,HTOT,P1,0,"",.ERR)
 I TYPH=3 D TYPE3 S MES=$$HPAR^%HXIHITR(GLH,NOMH,TYPH,LISTE,TOT1,REG1,N1,ABC,HTOT,P1,TOT2,ABC2,HTOT2,0,"",.ERR)
 I TYPH=2 D TYPE2 S MES=$$HSER^%HXIHITR(GLH,NOMH,TYPH,LISTE,TOT1,REG1,N1,ABC,HTOT,P1,REG2,N2,P2,ABC2,HTOT2,0,"",.ERR)
 I MODAF=1 D REAF^%TLIFEN,IND^%TLIACT3,REAF^%QUPILF("ATT"),REAF^%QUPILF("ACT"),REAF^%QUPILF("LOG")
 I MODAF=2 D REAF^%TLBAIF(0)
 Q NOMH
 
TYPE3() 
 
 S TOT2=V(IDE+13)
 I V(IDEB+15)'="" S TOT2=TOT2_"^"_V(IDEB+15)
 
 S ABC2=V(IDEB+16)
 
 S HTOT2=V(IDEB+17)
 Q 1
 
TYPE2() 
 
 S REG2=V(IDEB+13)
 I V(IDEB+15)'="" S REG2=REG2_"^"_V(IDEB+15)
 
 S N2=V(IDEB+16)
 
 S P2=V(IDEB+17)
 
 S ABC2=V(IDEB+18)
 
 S HTOT2=V(IDEB+19)
 Q 1

