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

;%MZMAJ2^INT^1^59547,73872^0
MOZMAJ2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
INT D INIT,INIS K SOPS S SOPS=0
INT1 S NLIS=$O(@TB2@("")) Q:NLIS=""  S LCS=@TB2@(NLIS),TYPS=$P(LCS,"^",1)+0
 I TYPS'=1 K @TB2@(NLIS) G INT1
 Q
 
DEB S NPHS="",COM=0,LCS=""
 S IDCS="",NLIS="",NMS=0
LOP S NLIS=$O(@TB2@(NLIS)) G:NLIS="" FIN S LCS=@TB2@(NLIS),TYPS=$P(LCS,"^",1)+0,LCS=$P(LCS,"^",2,999) G:TYPS'=2 LOP I LCS[$P(^OPVU($J,OP),"/",1) S SAVNLIS=NLIS G SUITE
0 G LOP
1 
 K VALS,ATT2 I '($D(^TORS3($J,NLIS))) Q
 D C(1) S SOPS=5E-1,IDCS="",NPHS=ATT2("NUMERO.OPERATION",1)
2 S NLIOP=NLIS,NLIS=SAVNLIS I ^TORS2($J,NLIS)="" Q
 
 S LCS=@TB2@(NLIS),TYPS=$P(LCS,"^",1)+0,LCS=$P(LCS,"^",2,999)
 G FIN:NPHS="" D C(2) G FIN:'($D(ATT2("ACTION"))),FIN:ATT2("ACTION",1)="",FIN:ATT2("NUMERO.OPERATION",1)=""
 S SOPS=$S($D(SOPS(NPHS)):SOPS(NPHS)+1,1:1),SOPS(NPHS)=SOPS+1,OPS=NPHS_"."_$TR($J("",3-$L(SOPS))," ",0)_SOPS,IDCS=ATT2("ACTION",1)_"/"_OPS
 S ^OPVUU($J,OPS)=IDCS,^OPVUU($J)=GAM
 
 I ^OPVUU($J,OPS)'=^OPVU($J,OP) S SOPS=SOPS-1,SOPS(NPHS)=SOPS(NPHS)-2 G LOP
COMPAR1 
 S ATT21="" F %U=1:1 S ATT21=$O(ATT2(ATT21)) Q:ATT21=""  S NORS="" F %U=1:1 S NORS=$O(ATT2(ATT21,NORS)) Q:NORS=""  I ATT2(ATT21,NORS)'=ATT(ATT21,NORS) S ^MOZMOUV($J,IDCS,ATT21,NORS)=NORS
 D INCR(NLIOP),INCR(NLIS) Q
 
 D PA^%QSGESTI($$GI^%MZQS,GAM,$$LIEN^%MZQS,IDCS,OPS),PA^%QSGESTI($$OI^%MZQS,GAM_","_IDCS,$$GE^%MZQS,GAM,1),PA^%QSGESTI($$OI^%MZQS,GAM_","_IDCS,"NOM",IDCS,1)
 S ATT2="" F %U=1:1 S ATT2=$O(ATT2(ATT2)) Q:ATT2=""  S NORS="" F %U=1:1 S NORS=$O(ATT2(ATT2,NORS)) Q:NORS=""  D PA^%QSGESTI($$OI^%MZQS,GAM_","_IDCS,ATT2,ATT2(ATT2,NORS),NORS)
 G LOP
3() 
 S NLIS=$O(@TB2@(NLIS)) I NLIS="" S FINCOM=1 Q 0
 S LCS=@TB2@(NLIS),TYPS=$P(LCS,"^",1)+0,LCS=$P(LCS,"^",2,999)
 I TYPS'=3 S FINCOM=1,NLIS=$S($ZP(@TB2@(NLIS))'="":$ZP(@TB2@(NLIS)),1:NLIS) Q 0
 D INCR(NLIS)
 Q:LCS=LC 1
 Q 0
C(I) 
 
 S %U="" F %V=1:1 S %U=$O(MOZ(I,%U)) Q:%U=""  S ATT2=$P(MOZ(I,%U),"^",1),VALS=$P(LCS,$C(1),%V),NORS=$P(MOZ(I,%U),"^",2) S:NORS="" NORS=1 D NET S ATT2(ATT2,NORS)=$$GETLBLAN^%VTLBLAN(VALS)
 Q
NET S LAVS=$E(VALS,1) Q:LAVS'=" "  S VALS=$E(VALS,2,99999) G NET
FIN Q
ATTS(TB2,ATT2) 
 S NOPX415=""
 F %U=0:0 S NOPX415=$O(^OPVUU($J,NOPX415)) Q:NOPX415=""  I $D(@TB2@(^OPVUU($J,NOPX415))) S IDFX415=^OPVUU($J,NOPX415),%NTT="" D TABI
 K %NTT,NOPX415,IDFX415 Q
 
TABI S %NTT=$O(@TB2@(IDFX415,%NTT))
 Q:%NTT=""
 D PA^%QSGESTI($$OI^%MZQS,^OPVUU($J)_","_IDFX415,ATT2,@TB2@(IDFX415,%NTT),%NTT)
 G TABI
 
INIS K ^TORS3($J),^TORS2($J),^TORS1($J) S %NX415="",%IX415=0,NOPS=""
T1 S %NX415=$O(@TB2@(%NX415)) G:%NX415="" T2 S %LX415=@TB2@(%NX415),%TX415=$P(%LX415,"^",1)+0
 I %TX415=1 S NOPS=$P($P(%LX415,"^",2,999),$C(1),1),%IX415=%IX415+1,^TORS1($J,%NX415)=NOPS G T1
 I %TX415=2 S %VX415=$ZP(^TORS1($J,%NX415)),^TORS2($J,%NX415)=%VX415 S:%VX415'="" ^TORS3($J,%VX415,%NX415)=""
 G T1
T2 K %TX415,%VX415,%NX415,%LX415,%IX415 Q
INIT K ATT2 S LI415="" F %U=1:1 S LI415=$O(MOZ(LI415)) Q:LI415=""  S ATX415="" F %U=1:1 S ATX415=$O(MOZ(LI415,ATX415)) Q:ATX415=""  S ATT2($P(MOZ(LI415,ATX415),"^",1))=ATX415
 K ATX415,LX415 Q
SUITE S NLIS=$ZP(@TB2@(NLIS)) G:(NLIS=0)!(NLIS="") FIN
BOUCL S LCS=@TB2@(NLIS),TYPS=$P(LCS,"^",1)+0,LCS=$P(LCS,"^",2,999) G:TYPS'=1 SUITE G 1
INCR(I) S ^MOZTABUU($J,I)="" Q
DELCOM(I,NLIS) 
 Q:NLIS=""
DELCOM1 S NLIS=$O(@TB2@(NLIS)) Q:NLIS=""  S LCS=@TB2@(NLIS),TYPS=$P(LCS,"^",1)+0 Q:TYPS'=3
 S LCS=$P(LCS,"^",2,999)
 D MSG^%VZEATT($$^%QZCHW("Suppression des commentaire de ")_SAVIDC)
 D PS^%QSGESTI($$OI^%MZQS,GAM_","_IDC,"COMMENTAIRE",LCS,I),INCR(NLIS)
 S I=I+1 G DELCOM1
 ;

