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

;TOINDOPH^INT^1^59547,74872^0
TOINDOPH ;
 S NOP=OG,IPH1=$P(PH(1),"~",1),IPH2=$E(PH,$L(IPH1)+2,999) S:IPH2="" IPH2="*" S IOP1=$P(OP(1),"~",1),IOP2=$E(OP,$L(IOP1)+2,999) S:IOP2="" IPO2="*"
 S EXIPH=$D(^PHASADM($I,NUFA,TWREF,"EXIPH",PH(1),OP(1),IPH1,IPH2)) G EXIPH:EXIPH S EXIF=$D(^PHASADM($I,NUFA,TWREF,"EXIPH",PH(1),OP(1),IPH1)) D:EXIF NEWN S ^PHASADM($I,NUFA,TWREF,"EXIPH",PH(1),OP(1),IPH1)=NOP
 S DEC=1,^PHASADM($I,NUFA,TWREF,"EXIPH",PH(1),OP(1),IPH1,IPH2)=NOP G:IOP2'="*" OPIN
OPNIN S NOP=$$GET2(NOP,OG) G FIN
OPIN S ^PHASADM($I,NUFA,TWREF,"EXIPH",PH(1),OP(1),IPH1,IPH2,IOP1)=DEC,NOP=$$GET(NOP,DEC) G FIN
EXIPH S NOP=^PHASADM($I,NUFA,TWREF,"EXIPH",PH(1),OP(1),IPH1,IPH2),DEC=$S($D(^PHASADM($I,NUFA,TWREF,"EXIPH",PH(1),OP(1),IPH1,IPH2,IOP1)):^PHASADM($I,NUFA,TWREF,"EXIPH",PH(1),OP(1),IPH1,IPH2,IOP1)+1,1:1) G OPIN:IOP2'="*",OPNIN
FIN Q
NEWN S OLDN=^PHASADM($I,NUFA,TWREF,"EXIPH",PH(1),OP(1),IPH1)
 S SIG=$E(OLDN,2,999),L1=$L(SIG),PDI=L1-1,@("INC="_"1E"_PDI),NOP=OLDN+INC
 K OLDN,SIG,L1,INC,PDI Q
GET(N,D) 
 Q (N_"."_$S(D<10:"0",1:"")_D)+0
GET2(N,D) 
 F %U=1:1 S E1=$E(N,%U) Q:E1=""  S E2=$E(D,%U) G:E1'=E2 GET3
 Q N
GET3 S E1=$E(D,%U+1,999) Q N+E1

